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
public class Comment {
	@NotBlank @NotNull
	private Integer commentNum;
	@NotBlank @NotNull
	private Integer communicationNum;
	private String commentPost;
	@NotBlank @NotNull
	private String writer;
	@JsonDeserialize(using = LocalDateDeserializer.class)
	@JsonFormat(pattern = "yyyy-MM-dd a HH:mm:ss", timezone="Asia/Seoul")
	private LocalDate writingDate;
	
	public Comment(Integer commentNum) {
		this.commentNum = commentNum;
	}
	
	
	


	@Override
	public String toString() {
		return String.format("commentNum : %d, "
				+ "communicationNum : %d, "
				+ "commentPost : %s, "
				+ "writer : %s, "
				+ "wDate : %s", commentNum, communicationNum, commentPost, writer, writingDate);
	}
}
