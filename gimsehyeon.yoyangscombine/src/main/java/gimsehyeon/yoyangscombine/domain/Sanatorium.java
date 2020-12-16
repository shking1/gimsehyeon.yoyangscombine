package gimsehyeon.yoyangscombine.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Sanatorium {
	private int sanaNum;
	private String sanaName;
	
	public int getSanaNum() {
		
		return this.sanaNum;
	}
}

