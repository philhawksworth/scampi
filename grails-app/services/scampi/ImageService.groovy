package scampi

class ImageService {

    boolean transactional = true

    def saveImage(request) {
		def mhsr = request.getFile('image')
		def fileName = mhsr.getOriginalFilename().replace(' ','_') 
		def filePath = "web-app/images/uploads/" + fileName
		log.debug(String.format("Saving file %s",fileName))
		def file = new File(filePath)
		if (!mhsr?.empty && mhsr.size < 1024*200){
			mhsr.transferTo(file)
		}
		return "/images/uploads/${fileName}"
    }
}
