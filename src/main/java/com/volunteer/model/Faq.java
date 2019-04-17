package com.volunteer.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity
@Table(name="faq")
@Proxy(lazy=false)
public class Faq {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String question;
	
	public Faq(){}
	public Faq(String question2, String answer2, int sequence){
		this.question=question2;
		this.answer=answer2;
		this.sequence_number=sequence;
	}
	public Faq(int pid, String question2, String answer2, int sequence) {
		this.id=pid;
		this.question=question2;
		this.answer=answer2;
		this.sequence_number=sequence;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Column
	private String answer;
	
	@Column
	private int sequence_number;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getSequence_number() {
		return sequence_number;
	}

	public void setSequence_number(int sequence_number) {
		this.sequence_number = sequence_number;
	}
	
}
