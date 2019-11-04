package jee.support.dao;

import jee.support.entity.Note;
import jee.support.entity.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface NoteDao {

    //根据id获取备忘录对象,如果不存在返回null
    @Select("select * from note where noteId=#{id}")
    public Note getNote(long id);

    //插入备忘录,返回新备忘录的id号
    @Insert("insert into note(name, type, date, dateCreated, body, userId)" +
            "value(#{name},#{type}, #{date}, #{dateCreated}, #{body}, #{user.userId})")
    @Options(useGeneratedKeys = true, keyProperty = "noteId")
    public long addNote(Note note);

    //删除备忘录
    @Delete("delete from note where noteId=#{id}")
    public int delNote(long noteId);

    //更新备忘录信息
    @Update("update note set body=#{body}, date=#{date}, type=#{type}" +
            "where noteId=#{noteId}")
    public int updateNote(Note note);

    //获取备忘录列表
    @Select("select * from note where userId=#{userId}")
    public List<Note> findAllNotes(User user);

    //获取备忘录列表By action
    @Select("select * from note where userId=#{user.userId} and type=#{action}")
    public List<Note> findNotetListByAction(@Param("user") User user, @Param("action") String action);
}
