package com.homeart.service.admin.Pic;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.admin.AdminPageInfoVO;
import com.homeart.domain.admin.AdminPicVO;
import com.homeart.mapper.admin.AdminPicMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;

@Log4j
@Service
public class AdminPicService {
	@Setter(onMethod_ = @Autowired)
	private AdminPicMapper mapper;
	
	@Value("${aws.accessKeyId}")
	private String accessKeyId;
	
	@Value("${aws.secretAccessKey}")
	private String secretAccessKey;
	
	@Value("${aws.bucketName}")
	private String bucketName;
	
	private Region region = Region.AP_NORTHEAST_2;
	
	private S3Client s3;
	
	@PostConstruct
	public void init() {
		AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKeyId, secretAccessKey);
		
		this.s3 = S3Client.builder().credentialsProvider(StaticCredentialsProvider.create(credentials))
				.region(region).build();
		
		System.out.println("########s3client########");
		System.out.println(s3);
	}
	
	private void deleteObject(String key) {
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder().bucket(bucketName)
												.key(key).build();
		
		s3.deleteObject(deleteObjectRequest);
	}

	public List<AdminPicVO> get(Long masterpiece_id) {
		
		log.info("get........." + masterpiece_id);
		
		return mapper.read(masterpiece_id);
	}

	@Transactional
	public void remove(Long masterpiece_id, MultipartFile file) {
		
		log.info("remove............" + masterpiece_id + file);
		
		if(file != null && file.getSize() > 0) {
			mapper.delete(masterpiece_id);
			
			String key = "masterpiece/" + masterpiece_id + "/" + file;
			deleteObject(key);
			
		}
		
		return;
	}

	public List<AdminPicVO> getList(Integer page, Integer numberPerPage) {
		
		Integer from = (page - 1) * 10;
		
		log.info("getList.......");
		
		return mapper.getList(from, numberPerPage);
	}
	
	public AdminPageInfoVO getPageInfo(Integer page, Integer numberPerPage) {
		Integer countRows = mapper.getCountRows();
		
		Integer lastPage = (countRows - 1) / numberPerPage + 1;
		Integer leftPageNumber = (page - 1) / 10 * 10 + 1;
		Integer rightPageNumber = (page - 1)/ 10 * 10 + 10;
		
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;
		
		Boolean hasPrevButton = leftPageNumber != 1;
		Boolean hasNextButton = rightPageNumber != lastPage;
		
		AdminPageInfoVO infoVo = new AdminPageInfoVO();
		
		infoVo.setCountRows(countRows);
		
		infoVo.setCurrentPage(page);
		infoVo.setLastPage(lastPage);
		infoVo.setLeftPageNumber(leftPageNumber);
		infoVo.setRightPageNumber(rightPageNumber);
		
		infoVo.setHasNextButton(hasNextButton);
		infoVo.setHasPrevButton(hasPrevButton);
		
		return infoVo;
	}
}
