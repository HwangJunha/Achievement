package util;

import java.io.File;

public class FileRemove {
	private File file;
	
	public boolean fileRemove() {
		if(this.file.exists()) {
			if(this.file.delete()) {
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}
	
	@Override
	public String toString() {
		return "FileRemove [file=" + file + "]";
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
}