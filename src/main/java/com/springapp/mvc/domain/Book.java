package com.springapp.mvc.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name="book", schema = "", catalog = "libruary_db")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Book.findAll", query = "SELECT b FROM Book b"),
    @NamedQuery(name = "Book.findById", query = "SELECT b FROM Book b WHERE b.id = :id"),
    @NamedQuery(name = "Book.findByName", query = "SELECT b FROM Book b WHERE b.name = :name"),
    @NamedQuery(name = "Book.findByUrl", query = "SELECT b FROM Book b WHERE b.url = :url"),
    })
public class Book implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Column(name = "book_id")
    private long id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 245)
    @Column(name = "book_name")
    private String name;
    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL} )
    @JoinTable(
            name = "libruary_db.book_author",
            joinColumns = @JoinColumn(name = "book_id"),
            inverseJoinColumns = @JoinColumn(name = "author_id"))
    public Set<Author> authors = new HashSet<>();
    @Size(max = 255)
    @Column(name = "url")
    private String url;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 245)
    @Column(name = "lang")
    private String lang;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 245)
    @Column(name = "year_of_publication")
    private String yearOfPublication;
    @Size(max = 255)
    @Column(name = "volume")
    private String volume;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 245)
    @Column(name = "publisher")
    private String publisher;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 245)
    @Column(name = "city_of_publication")
    private String cityOfPublication;
    @Basic(optional = false)   
    @Size(min = 1, max = 245)
    @Column(name = "photo1")
    private String photo1;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description; 
    
    public Book() {       
    }
    
    public Book(String bookName) {
        this.name = bookName;
    }
 
    public Book(String name, String lang, String yearOfPublication, 
            String volume, String publisher, String cityOfPublication) {
        this.name = name;
        this.lang = lang;
        this.yearOfPublication = yearOfPublication;
        this.volume = volume;
        this.publisher = publisher;
        this.cityOfPublication = cityOfPublication;       
    }

    public long getId() {
        return id;
    }
    
    public void setId(long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = getFormatedString(url);
    }
    
    public String getLang() {
        return lang;
    }
    
    public void setLang(String lang) {
        this.lang = lang;
    }
    
    public String getYearOfPublication() {
        return yearOfPublication;
    }
    
    public void setYearOfPublication(String year) {
        this.yearOfPublication = year;
    }
    
    public String getVolume() {
        return volume;
    }

    public void setVolume(String volume) {
        this.volume = volume;
    }
    
    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    
     public String getCityOfPublication() {
        return cityOfPublication;
    }

    public void setCityOfPublication(String city) {
        this.cityOfPublication = city;
    }
 
    public Set<Author> getAuthors() {
        return authors;
    }
    
    public void setAuthors(Set<Author> authors) {
        this.authors = authors;
    }
    
     public void addAuthor(Author author) {
        this.authors.add(author);
    }
     
    public String getPhoto1() {
        return photo1;
    }

    public void setPhoto1(String photo1) {
        this.photo1 = "books/"+getFormatedString(photo1)+".jpg";
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (name != null ? name.hashCode() : 0)+
                (publisher != null ? publisher.hashCode() : 0)+
                (yearOfPublication != null ? yearOfPublication.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Book)) {
            return false;
        }
        Book other = (Book) object;
        if ((this.name == null && other.name != null) || 
                (this.name != null && !this.name.equals(other.name))) {
            return false;
        } else if ((this.publisher == null && other.publisher != null) || 
                (this.publisher != null && !this.publisher.equals(other.publisher))) {
            return false;
        } else if ((this.yearOfPublication == null && other.yearOfPublication != null) || 
                (this.yearOfPublication != null && !this.yearOfPublication.equals(other.yearOfPublication))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.springapp.mvc.domain.Book[ name=" + name + " ]";
    }
    
    private String getFormatedString(String str){
        if(str.length()>20){
            String substr = str.substring(0, 19);
            str = substr.substring(0, substr.lastIndexOf(" ")).toLowerCase();          
        }            
        String modifiedStr = str.replaceAll(" ", "-")
            .replaceAll("'", "-")
            .replaceAll("\"", "-")
            .replaceAll(",", "-")
            .replaceAll(":", "-")
            .replaceAll(";", "-")
            .replaceAll("\\.", "-")
            .replaceAll("&", "-") 
            .replaceAll("/", "-") 
            .replaceAll("\\|", "-")
            .replaceAll("!", "-")
            .replaceAll("\\?", "-")
            .replaceAll("\\(", "-")
            .replaceAll("\\)", "-")
            .replaceAll("---", "-") 
            .replaceAll("--", "-")
            .replaceAll("--", "-") ; 
    return modifiedStr;
    }
}
