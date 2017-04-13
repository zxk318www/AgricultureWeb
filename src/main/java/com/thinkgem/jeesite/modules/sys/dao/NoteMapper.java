package com.thinkgem.jeesite.modules.sys.dao;



import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.agriculture.entity.Note;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
@MyBatisDao
public interface NoteMapper {

    Note findOne(String id);

    Note findDeleteOne(String id);

    int findMaxById();

    Note findNoteByTitle(String title);

    List<Note> findLastNotes();

    List<Note> find(Object param);

    List<Note> findState(Object param);

    List<Note> findDelete(Object param);

    List<Note> findByuid(String uid);

    void deleteOne(String id);

    void delete(Note param);

    void insert(Note param);

    void update(Note param);

    void updateWithAllFields(Note param);

}
