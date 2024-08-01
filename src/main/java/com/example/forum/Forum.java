package com.example.forum;

import org.springframework.web.multipart.MultipartFile;

public class Forum {
    private int cid;
    private String title;
    private String media;
    private String date;
    private String content;

    private MultipartFile mediaFile;

    public MultipartFile getMediaFile() {return mediaFile;}
    public void setMediaFile(MultipartFile mediaFile) {this.mediaFile = mediaFile;}

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMedia() {
        return media;
    }

    public void setMedia(String media) {
        this.media = media;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
