package com.example.forum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/forum")
public class ForumWebController {
    final ForumDAO dao;

    @Value("${forum.media.dir}")
    String mediaDir;

    @Autowired
    public ForumWebController(ForumDAO dao) {this.dao = dao;}

    @PostMapping("/add")
    public String addForum(@ModelAttribute Forum forum, Model m, @RequestParam("file") MultipartFile file) {

        try {
            String fileName = file.getOriginalFilename();
            String sysName = System.currentTimeMillis() + fileName.substring(fileName.lastIndexOf("."));
            File dest = new File(mediaDir+ "/" + sysName);
            file.transferTo(dest);

            forum.setMedia("/media/" + dest.getName());
            dao.addForum(forum);
        }catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "글이 정상적으로 등록 되지 않았습니다!");
        }
        return "redirect:/forum/list";
    }

    @GetMapping("/delete/{cid}")
    public String deleteForum(@PathVariable int cid, Model m) {

        try {
            dao.delForum(cid);
        }catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "글이 정상적으로 삭제 되지 않았습니다!");
        }
        return "redirect:/forum/list";
    }

    @PostMapping("/update")
    public String updateForum(@ModelAttribute Forum f, Model m, @RequestParam("file") MultipartFile file) {
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
            m.addAttribute("error", "글이 정상적으로 수정되지 않았습니다!");
        }
        return "redirect:/forum/list";
    }

    @GetMapping("/list")
    public String listForum(Model m) {
        List<Forum> list;

        try {
            list = dao.getAll();
            m.addAttribute("forum", list);
        }catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "글 목록이 정상적으로 처리되지 않았습니다!");
        }
        return "forum/list";
    }
    @GetMapping("/home")
    public String Home() {
        return "forum/home";
    }

    @GetMapping("/check")
    public String check() {
        return "forum/check";
    }

    @GetMapping("/{cid}")
    public String getForum(@PathVariable int cid, Model m) {
        Forum f;

        try {
            f = dao.getForum(cid);
            m.addAttribute("forum", f);
        }catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("error", "글을 성공적으로 불러오지 못했습니다.");
        }
        return "forum/view";
    }


}
