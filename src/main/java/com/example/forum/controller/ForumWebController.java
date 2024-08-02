package com.example.forum.controller;

import com.example.forum.dao.ForumDAO;
import com.example.forum.dto.Forum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@RestController
@RequestMapping("/")
public class ForumWebController {

    final ForumDAO dao;

    @Value("${forum.media.dir}")
    String mediaDir;

    @Autowired
    public ForumWebController(ForumDAO dao) {this.dao = dao;}

    @PostMapping("/add")
    public String addForum(@ModelAttribute Forum forum, @RequestParam("file") MultipartFile file) {

        try {
            String fileName = file.getOriginalFilename();
            String sysName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
            File dest = new File(mediaDir+ "/" + sysName);
            file.transferTo(dest);

            forum.setMedia("/media/" + dest.getName());
            dao.addForum(forum);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/list";
    }

    @DeleteMapping("/delete/{cid}")
    public String deleteForum(@PathVariable int cid) {

        try {
            dao.delForum(cid);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/list";
    }

    @PutMapping("/update")
    public String updateForum(@ModelAttribute Forum f, @RequestParam("file") MultipartFile file) {
        try {
            if (file != null && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                String sysName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
                File dest = new File(mediaDir + "/" + sysName);
                file.transferTo(dest);

                f.setMedia("/media/" + dest.getName());
            }
            dao.updateForum(f);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/list";
    }

    @GetMapping("/list")
    public String listForum() {
        List<Forum> list;

        try {
            list = dao.getAll();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "/list";
    }
    @GetMapping("/home")
    public String Home() {
        return "/home";
    }

    @GetMapping("/check")
    public String check() {
        return "/check";
    }

    @GetMapping("/{cid}")
    public String getForum(@PathVariable int cid) {
        Forum f;

        try {
            f = dao.getForum(cid);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "/view";
    }


}
