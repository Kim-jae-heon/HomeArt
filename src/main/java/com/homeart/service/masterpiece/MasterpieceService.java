package com.homeart.service.masterpiece;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.homeart.domain.masterpiece.MasterpieceVO;
import com.homeart.domain.masterpiece.PageInfoVO;
import com.homeart.mapper.masterpiece.MasterpieceMapper;

import lombok.Setter;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
public class MasterpieceService {

	@Setter(onMethod_ = @Autowired)
	private MasterpieceMapper mapper;

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

		System.out.println("############# s3 client ###############");
		System.out.println(s3);
	}

	// s3에서 key에 해당하는 객체 삭제
	private void deleteObject(String key) {
		DeleteObjectRequest deleteObjectRequest = DeleteObjectRequest.builder()
																	.bucket(bucketName)
																	.key(key)
																	.build();

		s3.deleteObject(deleteObjectRequest);
	}

	// s3에서 key로 객체 업로드(put)
	private void putObject(String key, Long size, InputStream source) {
		PutObjectRequest putObjectRequest = PutObjectRequest.builder()
				                                            .bucket(bucketName)
				                                            .key(key)
				                                            .acl(ObjectCannedACL.PUBLIC_READ)
				                                            .build();
		
		RequestBody requestBody = RequestBody.fromInputStream(source, size);
		
		s3.putObject(putObjectRequest, requestBody);
	}

	public MasterpieceVO get(Integer id) {
		return mapper.read(id);
	}

	public boolean modify(MasterpieceVO masterpiece) {
		return mapper.update(masterpiece) == 1;
	}

	

	public List<MasterpieceVO> getList() {
		return mapper.getList();
	}

	public List<MasterpieceVO> getListPage(Integer page, Integer numberPerPage) {

		// sql에서 사용할 record 시작 번호 (0-index)
		Integer from = (page - 1) * 10;

		return mapper.getListPage(from, numberPerPage);
	}

	public PageInfoVO getPageInfo(Integer page, Integer numberPerPage) {
		// 총 게시물 수
		Integer countRows = mapper.getCountRows();

		// 마지막 페이지 번호
		Integer lastPage = (countRows - 1) / numberPerPage + 1;

		// 페이지네이션 가장 왼쪽 번호
		Integer leftPageNumber = (page - 1) / 10 * 10 + 1;

		// 페이지네이션 가장 오른쪽 번호
		Integer rightPageNumber = (page - 1) / 10 * 10 + 10;
		// 가장 마지막 페이지를 넘어가지 않도록
		rightPageNumber = rightPageNumber > lastPage ? lastPage : rightPageNumber;

		// 이전 페이지 버튼 존재 유무
		Boolean hasPrevButton = leftPageNumber != 1;

		// 다음 페이지 버튼 존재 유무
		Boolean hasNextButton = rightPageNumber != lastPage;

		PageInfoVO pageInfo = new PageInfoVO();

		pageInfo.setLastPage(lastPage);
		pageInfo.setCountRows(countRows);
		pageInfo.setCurrentPage(page);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setHasPrevButton(hasPrevButton);
		pageInfo.setHasNextButton(hasNextButton);

		return pageInfo;
	}

	@Transactional
	public void register(MasterpieceVO MasterpieceVO, MultipartFile file) throws Exception {

		// write files
		// 2. s3에 파일 업로드

			if (file != null && file.getSize() > 0) {
				mapper.insert(MasterpieceVO);
				
				// 2.1 파일 작성, s3
				String key = "masterpiece/" + MasterpieceVO.getMasterpiece_id() + "/" + file.getOriginalFilename();
				putObject(key, file.getSize(), file.getInputStream());

				// 2.2 insert into File , DATABSE
			}
			
			return;

	}

	
}
