package gimsehyeon.yoyangscombine.domain;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateDeserializer;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Communication {
	@NotBlank @NotNull
	private int communicationNum;
	@NotBlank @NotNull
	private String writer;
	@NotBlank @NotNull
	private String communicationTitle;
	private String communicationPost;
	@JsonDeserialize(using = LocalDateDeserializer.class)
	@JsonFormat(pattern = "yyyy-MM-dd a HH:mm:ss", timezone="Asia/Seoul")
	private LocalDate writingDate;
	private int cnt;
	
	

	public Communication(int communicationNum) {
		this.communicationNum = communicationNum;
	}
	
	@Override
	public String toString() {
		return String.format("commNum : %d, "
				+ "writer : %s, "
				+ "commTitle : %s, "
				+ "commPost : %s, "
				+ "wDate : %s", communicationNum, writer, communicationTitle, communicationTitle, writingDate);
	}
}
