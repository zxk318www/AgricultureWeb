package com.thinkgem.jeesite.modules.agriculture.dao;



import com.thinkgem.jeesite.modules.agriculture.entity.Note;

import java.util.List;


/**
 * Mapper
 * 
 * @author Silver Howe
 * @version 1.0, 2017/2/10 15:59:51
 */
public interface NoteDao {

    Note findOne(String id);

    List<Note> find(Object param);

    void deleteOne(String id);

    void delete(Note param);

    void insert(Note param);

    void update(Note param);

    void updateWithAllFields(Note param);

}
