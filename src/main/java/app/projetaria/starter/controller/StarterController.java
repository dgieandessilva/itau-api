package app.projetaria.starter.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import app.projetaria.starter.entity.Start;
import app.projetaria.starter.repository.StartRepository;

@RestController
@RequestMapping("/api/v1/start")
public class StarterController {

	@Autowired
	private StartRepository repository;
	
	@GetMapping
	public ResponseEntity<List<Start>> findAll() {
		return ResponseEntity.ok().body(this.repository.findAll());
	}
	
	@PostMapping
	public ResponseEntity<Start> save(@RequestBody Start start) {
		return ResponseEntity.ok().body(this.repository.save(start));
	}
}
