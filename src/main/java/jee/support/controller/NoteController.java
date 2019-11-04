package jee.support.controller;

import com.github.pagehelper.PageInfo;
import jee.support.constants.Constants;
import jee.support.dao.UserDao;
import jee.support.entity.Note;
import jee.support.entity.User;
import jee.support.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/notes")
public class NoteController {
    @Autowired
    NoteService noteService;
    @Autowired
    UserDao userDao;

    @RequestMapping(value = {"/create"}, method = RequestMethod.GET)
    public String toCreateNoteForm() {
        return "addNote";
    }

    //添加备忘录
    @RequestMapping(value = {"/create"}, method = RequestMethod.POST)
    public String createNote(Note note,
                             HttpSession session) {
        //将相关记录插入数据库
        System.out.println(note);
        //获取当前用户对象
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        note.setUser(user);
        long noteId = noteService.addNote(note);
        //跳转到查看详情的界面
        return "redirect:view/" + noteId;
    }

    //查看备忘录
    @RequestMapping("/view/{noteId}")
    public String viewTicket(@PathVariable("noteId") Long id,
                             Model model) {
        Note note = noteService.getNote(id);
        model.addAttribute("note", note);
        return "viewNote";
    }

    //分页显示备忘录
    @GetMapping(value = {"/list", "/", ""})
    public String pageNoteList(@RequestParam(value = "page", defaultValue = "1") int page,
                               @RequestParam(value = "size", defaultValue = "10") int size,
                               Model model,
                               HttpSession session) {
        //获取当前用户对象
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        System.out.println("userID为：" + user.getUserId());

        //默认每页记录
        PageInfo<Note> pageInfo = noteService.findNotetList(page, size, user);
        model.addAttribute("pageInfo", pageInfo);
        return "listNotePage";
    }

    //分页显示备忘录
    @GetMapping(value = {"/list_ac"})
    public String pageNoteListWithAction(@RequestParam(value = "page", defaultValue = "1") int page,
                                         @RequestParam(value = "size", defaultValue = "10") int size, @RequestParam(value = "action", defaultValue = "") String action,
                                         Model model,
                                         HttpSession session) {

        //获取当前用户对象
        User user = (User) session.getAttribute(Constants.SESSION_USER);
        System.out.println("userID为：" + user.getUserId());
        switch (action){
            case "study":
                action="学习";
                break;
            case "love":
                action="恋爱";
                break;
            case "yundong":
                action="运动";
                break;
            case "waichu":
                action="外出";
                break;
            case "shenghuo":
                action="生活";
                break;
        }
        //默认每页记录by action
        PageInfo<Note> pageInfo = noteService.findNotetListByAction(page, size, user, action);
        model.addAttribute("pageInfo", pageInfo);
        return "listNotePage_ac";
    }


    //跳转到编辑备忘录的页面
    @RequestMapping(value = "/edit/{noteId}", method = RequestMethod.GET)
    public String toEdit(@PathVariable("noteId") Integer id, Model model) {
        //获取备忘录
        Note note = noteService.getNote(id);
        model.addAttribute("noteId", id);
        model.addAttribute("note", note);
        return "editNote";
    }

    //更新备忘录对象
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(Note note,
                         @RequestParam("noteId") long noteId,
                         Model model,
                         HttpSession session) {
        noteService.updateNote(noteId, note);
        return "redirect:/notes/view/" + noteId;
    }

    //删除备忘录对象
    @RequestMapping(value = "/del/{noteId}", method = RequestMethod.GET)
    public String delete(@PathVariable("noteId") long noteId) {
        //获取备忘录
        noteService.delNote(noteId);
        return "redirect:/notes";
    }
}
