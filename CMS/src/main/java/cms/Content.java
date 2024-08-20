package cms;

import java.time.LocalTime;
import java.util.Date;

import jakarta.persistence.*;

@Entity
@Table(name = "Content")
public class Content {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Content_Id")
	private int id;
	
	@Column(name = "Title")
	private String title;
	
	@Column(name = "Content")
	private String content;
	
	@Column(name = "Publication_Date")
	private Date publication_date;
	
	@Column(name = "Author_Information")
	private String author_information;
	
	@Column(name = "Category")
	private String category;

	public Content() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Content(int id, String title, String content, Date publication_date, String author_information,
			String category) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.publication_date = publication_date;
		this.author_information = author_information;
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPublication_date() {
		return publication_date;
	}

	public void setPublication_date(Date publication_date) {
		this.publication_date = publication_date;
	}

	public String getAuthor_information() {
		return author_information;
	}

	public void setAuthor_information(String author_information) {
		this.author_information = author_information;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
}
