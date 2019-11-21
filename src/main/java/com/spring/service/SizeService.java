/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.entities.Size;
import com.spring.repositories.SizeRepository;

/**
 *
 * @author Admin
 */
@Service
public class SizeService {

	@Autowired
	private SizeRepository sizeRepository;

	public List<Size> getSizes() {
		return (List<Size>) sizeRepository.findAll();
	}

	public Size save(Size s) {
		return sizeRepository.save(s);
	}
	
	
	public void delete(List<Size> s) {
		for(Size size : s) {
			sizeRepository.delete(size.getId());
		}
	}
}
