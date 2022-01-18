package com.homeart.service.admin.picShare;

import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.admin.AdminPageInfoVO;
import com.homeart.domain.admin.AdminPicShareVO;
import com.homeart.mapper.admin.AdminPicShareMapper;

import lombok.Setter;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;

@Service
public class AdminPicShareService {
	@Setter(onMethod_ = @Autowired)
	private AdminPicShareMapper boardMapper;
	
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
		// spring bean이 만들어진 후 최초로 실행되는 코드 작성
		
		// 권한 정보 객체
		AwsBasicCredentials credentials = AwsBasicCredentials.create(accessKeyId, secretAccessKey);
		
		// crud 가능한 s3 client 객체 생성
		this.s3 = S3Client.builder()
				.credentialsProvider(StaticCredentialsProvider.create(credentials))
				.region(region)
				.build();
	
		System.out.println("#######s3client########");
		System.out.println(s3);
		
	}
	

	// s3에서 key로 객체 삭제
	private void deleteObject(String key) {
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
																	.bucket(bucketName)
																	.key(key).build();
		
		s3.deleteObject(deleteObjectRequest);
	}
	
	public List<AdminPicShareVO> getListPage(Integer page, Integer numberPerPage) {
		
		Integer from = (page-1) * 10;
		
		return boardMapper.getListPage(from, numberPerPage);
	}

	public AdminPageInfoVO getPageInfo(Integer page, Integer numberPerPage) {
		
		Integer countRows = boardMapper.getCountRows();
		
		Integer lastPage = (countRows - 1) / numberPerPage + 1;
		Integer leftPageNumber = (page - 1) / 10 * 10 + 1;
		Integer rightPageNumber = (page - 1) / 10 * 10 + 10;
		
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;
		
		Boolean hasPrevButton = leftPageNumber != 1;
		Boolean hasNextButton = rightPageNumber != lastPage;
		
		AdminPageInfoVO picPageInfo = new AdminPageInfoVO();
		
		picPageInfo.setCountRows(countRows);
		
		picPageInfo.setCurrentPage(page);
		picPageInfo.setLastPage(lastPage);
		picPageInfo.setLeftPageNumber(leftPageNumber);
		picPageInfo.setRightPageNumber(rightPageNumber);
		
		picPageInfo.setHasNextButton(hasNextButton);
		picPageInfo.setHasPrevButton(hasPrevButton);
		
		return picPageInfo;
	}

	public AdminPicShareVO get(Integer id) {
		return boardMapper.read(id);
	}
	
	@Transactional
	public void remove(@Param("id") Integer id, MultipartFile file) {
		
		if (file != null && file.getSize() > 0) {
			boardMapper.delete(id);
			
			String key = "picShare/" + id + "/" + file; 
			deleteObject(key);
			
		}
		
		return;
		
	}
}
