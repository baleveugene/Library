package com.springapp.mvc.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name="author", schema = "", catalog = "libruary_db")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Author.findAll", query = "SELECT a FROM Author a"),
    @NamedQuery(name = "Author.findById", query = "SELECT a FROM Author a WHERE a.id = :id"),
    @NamedQuery(name = "Author.findByName", query = "SELECT a FROM Author a WHERE a.name = :name"),
    @NamedQuery(name = "Author.findByUrl", query = "SELECT a FROM Author a WHERE a.url = :url"),
    })
public class Author implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue
    @Column(name = "author_id")
    private long id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 245)
    @Column(name = "author_name")
    private String name;
    @Size(max = 255)
    @Column(name = "url")
    private String url;
    @Lob
    @Size(max = 65535)
    @Column(name = "description")
    private String description; 
    @Basic(optional = false)   
    @Size(min = 1, max = 245)
    @Column(name = "photo1")
    private String photo1;
    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "authors")   
    public Set<Book> books = new HashSet<>();
    
    public Author() {       
    }
    
    public Author(String authorName) {
        this.name = authorName;
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
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getPhoto1() {
        return photo1;
    }

    public void setPhoto1(String photo1) {
        this.photo1 = "authors/"+getFormatedString(photo1)+".jpg";
    }
    
    public Set<Book> getBooks() {
        return books;
    }
    
    public void setBooks(Set<Book> books) {
        this.books = books;
    }
    
     public void addBook(Book book) {
        this.books.add(book);
    }
  
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (name != null ? name.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {        
        if (!(object instanceof Author)) {
            return false;
        }
        Author other = (Author) object;
        if ((this.name == null && other.name != null) || 
                (this.name != null && !this.name.equals(other.name))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.springapp.mvc.domain.Author[ name=" + name + " ]";
    }
    
    private String getFormatedString(String str){
        if(str.length()>20){
            String substr = str.substring(0, 19);
            str = substr.substring(0, substr.lastIndexOf(" ")).toLowerCase();;           
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
