package jee.support.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jee.support.dao.NoteDao;
import jee.support.entity.Note;
import jee.support.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service
public class NoteService {
    @Autowired
    NoteDao noteDao;

    //根据id获取备忘录对象,如果不存在返回null
    public Note getNote(long id) {
        return noteDao.getNote(id);
    }

    // 添加备忘录,返回该备忘录对应的id号
    @Transactional(rollbackFor = Exception.class)  //处理事务回滚
    public long addNote(Note note) {
        //设置备忘录默认信息
        note.setDateCreated(new Date());
        noteDao.addNote(note);
        // 插入备忘录记录,获取备忘录id
        long noteId = note.getNoteId();
        System.out.println("new id:" + noteId);
        return noteId;
    }

    //删除备忘录
    @Transactional
    public int delNote(long NoteId) {
        return noteDao.delNote(NoteId);
    }

    //更新备忘录信息
    //返回受影响的行数
    @Transactional
    public int updateNote(long id, Note note) {
        note.setNoteId(id); //设置更新的note的id
        return noteDao.updateNote(note);
    }

    //获取备忘录列表
    //入参: 当期页, 每页的记录数
    public PageInfo<Note> findNotetList(int page, int size, User user){
        PageHelper.startPage(page, size);
        List list = noteDao.findAllNotes(user);
        PageInfo<Note> pageInfo = new PageInfo<>(list);

        return  pageInfo;  //获取分页对象
    }

    //获取备忘录列表by action
    //入参: 当期页, 每页的记录数
    public PageInfo<Note> findNotetListByAction(int page, int size, User user, String action){
        PageHelper.startPage(page, size);
        System.out.println((user.toString()));
        List list = noteDao.findNotetListByAction(user, action);
        PageInfo<Note> pageInfo = new PageInfo<>(list);

        return  pageInfo;  //获取分页对象
    }

    public static void main(String[] args) {
    }
}
