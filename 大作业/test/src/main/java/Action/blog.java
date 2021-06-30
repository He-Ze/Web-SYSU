package Action;


public class blog {
    String category, title, body, imageURL, author, status, date;
    int blogId, likeCount, commentCount;
    public blog(String category, String title, String body, String imageURL, String author, String status, int blogId, String date, int likeCount, int commentCount) {
        this.category = category;
        this.title = title;
        this.body = body;
        this.imageURL = imageURL;
        this.author = author;
        this.status = status;
        this.blogId = blogId;
        this.date = date;
        this.likeCount = likeCount;
        this.commentCount = commentCount;
    }

    public blog(String category, String title, String body, String imageURL, String author, String date, int blogId, int likeCount, int commentCount) {
        this.category = category;
        this.title = title;
        this.body = body;
        this.imageURL = imageURL;
        this.author = author;
        this.blogId = blogId;
        this.date = date;
        this.likeCount = likeCount;
        this.commentCount = commentCount;
    }

    public blog(int blogId, String category, String title, String body, String imageURL, String author, String date) {
        this.blogId = blogId;
        this.category = category;
        this.title = title;
        this.body = body;
        this.imageURL = imageURL;
        this.author = author;
        this.date = date;
    }

    public blog(String category, String title, String body, String imageURL, String author, String date, String status) {
        this.category = category;
        this.title = title;
        this.body = body;
        this.imageURL = imageURL;
        this.author = author;
        this.date = date;
        this.status = status;
    }

    public blog(String category, String title, String body, String imageURL, String author, int blogId, String date, int likeCount, int commentCount) {
        this.category = category;
        this.title = title;
        this.body = body;
        this.imageURL = imageURL;
        this.author = author;
        this.blogId = blogId;
        this.date = date;
        this.likeCount = likeCount;
        this.commentCount = commentCount;

    }

    blog(String category, String title, String body, String imageURL, String status, String author, int blogId) {
        this.category = category;
        this.title = title;
        this.body = body;
        this.imageURL = imageURL;
        this.status = status;
        this.author = author;
        this.blogId = blogId;


    }

    blog(int blogId, String category, String title, String body, String imageURL, String author, String date, int likeCount, int commentCount) {
        this.blogId = blogId;
        this.category = category;
        this.title = title;
        this.body = body;
        this.imageURL = imageURL;
        this.author = author;
        this.date = date;
        this.likeCount = likeCount;
        this.commentCount = commentCount;


    }


    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }


}
