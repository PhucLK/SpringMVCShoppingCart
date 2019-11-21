package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.Images;
import com.spring.entities.Size;
import com.spring.repositories.ImageRepository;

@Service
public class ImageService {

	@Autowired
	private ImageRepository imageRepository;

	public Images saveImage(Images image) {
		return imageRepository.save(image);
	}

	public Images find(int id) {
		return imageRepository.findOne(id);
	}

	public List<Images> getAllImages() {
		return (List<Images>) imageRepository.findAll();
	}

	public void delete(List<Images> image) {
		for(Images i : image) {
			imageRepository.delete(i.getId());
		}
	}
}
