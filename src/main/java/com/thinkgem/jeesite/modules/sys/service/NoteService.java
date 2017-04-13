package com.thinkgem.jeesite.modules.sys.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.agriculture.entity.*;
import com.thinkgem.jeesite.modules.sys.dao.*;
import com.thinkgem.jeesite.modules.sys.web.MiniPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Zhangsnke on 2017/3/1.
 */
@Service
@Transactional(readOnly = true)
public class NoteService {
    /**用户*/
    @Autowired
    UserMapper userMapper;

    /**用户信息*/
    @Autowired
    UserinfoMapper userinfoMapper;

    /**管理员信息*/
    @Autowired
    AdmininfoMapper admininfoMapper;

    /**帖子信息*/
    @Autowired
    NoteMapper noteMapper;

    /**回帖信息*/
    @Autowired
    MsgMapper msgMapper;

    @Autowired
    SysnoticeService sysnoticeService;

    /**
     * 通过帖子类型查找帖子
     * @param type
     * @return
     */
    public  List<Note> findNoteByType(String type){
        List<Note> list = noteMapper.find(type);
        return list;
    }

    /**
     * 通过帖子id进行查询
     * @param id
     * @return
     */
    public Note findById(String id){
        Note note = noteMapper.findOne(id);
        return note;
    }

    /**
     * 查询所有帖子
     * @return
     */
    public MiniPage findAll(MiniPage mp,Note n,int a){
        Page<Note> page = new Page<Note>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if("num".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("postdate".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }
        System.out.println("t."+mp.getSortField()+" "+mp.getSortOrder());
        n.setPage(page);
        List<Note> list = noteMapper.findState(n);
        //管理员和帖子用户
        if (a==1){
           list = noteMapper.find(n);
        }
        if(list.size()!=0){
            for (Note note :list){
                if (StringUtils.isNoneBlank(note.getContent())){
                    String str = note.getContent();
                    str = str.replace("style=\"max-width:800px; max-height:600px\"/>","style=\"max-width:50px; max-height:40px\"/>");
                    note.setContent(str);
                }
                if (note.getState()==0){
                    note.setStateStr("展示");
                }else if(note.getState()==1){
                    note.setStateStr("下线整改");
                }else if(note.getState()==2){
                    note.setStateStr("驳回");
                }
            }
            mp.setTotal(page.getCount());
            mp.setData(list);
        }
        return mp;
    }


    /**
     * 查询所有帖子
     * @return
     */
    public MiniPage findAllMsg(MiniPage mp,Msg msg){
        Page<Msg> page = new Page<Msg>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

         if("createDate".equals(mp.getSortField())){
            page.setOrderBy("t.create_date"+" "+mp.getSortOrder());
        }
        msg.setPage(page);
        List<Msg> list = msgMapper.findDESC(msg);
        if(list.size()!=0){
            for (Msg msg1 :list){
                if (msg1!=null){
                    Note note = noteMapper.findOne(msg1.getNoteid());
                    if (note!=null){
                        msg1.setNoteName(note.getTitle());
                    }
                    if (msg1.getLou()!=0){
                        int a = msg1.getLou();
                        String str = String.valueOf(a);
                        msg1.setLoustr("第"+str+"楼");
                    }
                    if (StringUtils.isNoneBlank(msg1.getMsg())){
                        String str = msg1.getMsg();
                        if(str.contains("style=\"max-width:300px; max-height:280px\"/>")){
                            str = str.replace("style=\"max-width:300px; max-height:280px\"/>",
                                    "border=\"0\" alt=\"\" style=\"max-height:50px; max-width:50px;\" />");
                        }else if(str.contains("style=\"width:560px;height:362px;\">")){
                            str = str.replace("style=\"width:560px;height:362px;\">","style=\"display:none\">");

                        }else{
                            str = str.replace("alt=\"\" />","border=\"0\" alt=\"\" style=\"max-height:50px; max-width:50px;\" />");
                        }

                        msg1.setMsg(str);
                    }
                }
            }
            mp.setTotal(page.getCount());
            mp.setData(list);
        }
        return mp;
    }


    /**
     * 查询最近的5个帖子信息
     * @return
     */
    public List<Note> findLastNotes(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        List<Note> list = noteMapper.findLastNotes();
        if (list!=null && list.size()>0){
            for(Note note :list){
                if (note.getPostdate()!=null){
                    String str = sdf.format(note.getPostdate());
                    note.setPostdateStr(str);
                }
                //控制显示的贴吧标题数
                if(StringUtils.isNoneBlank(note.getTitle())){
                    String str = note.getTitle();
                    if (StringUtils.length(str)>10){
                        str = str.substring(0,8);
                        str = str+"...";
                        note.setTitle(str);
                    }
                }
            }
            return list;
        }
        return  null;
    }

    /**
     * 查询所有的回复消息
     * @param msg
     * @return
     */
    public List<Msg>  findAllMsg(Msg msg){
        if(msg!=null){
          List<Msg> list =  msgMapper.find(msg);
            return  list;
        }
        return  null;
    }

    public List<Msg> findMsgAll(){
        List<Msg> list = msgMapper.find(null);
        return list;
    }

    /**
     * 分页显示所有的回复帖子信息
     * @param mp
     * @param msg
     * @param modelMap
     * @return
     */
    public MiniPage findAllMsgByPage(MiniPage mp,Msg msg,ModelMap modelMap){
        Page<Msg> page = new Page<Msg>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        msg.setPage(page);
        List<Msg> list = msgMapper.find(msg);
        if(list.size()!=0){
            mp.setData(list);
            mp.setTotal(list.size());
        }
        //求取总页数
        BigDecimal b1 = new BigDecimal(page.getCount());
        BigDecimal b2 = new BigDecimal(page.getPageSize());
        BigDecimal b3 = b1.divide(b2, 3, BigDecimal.ROUND_HALF_EVEN);
        b3 = b3.setScale(0, BigDecimal.ROUND_UP);
        System.out.println("总页数："+b3);
        modelMap.put("totalpages",b3);
        modelMap.put("totalgoods",page.getCount());
        return mp;
    }



    /**
     * 将图片放大
     * @param img
     * @return
     */
    public String changeBig(String img){
        if(StringUtils.isNoneBlank(img)){
            String str =img;
            str = str.replace("style=\"max-width:20px; max-height:20px\"/>"," style=\"max-width:60px; max-height:60px\"/>");
            System.out.println(str);
            return str;
        }
        return null;
    }

    /**
     * 补全Msg
     * @param msg
     * @return
     */
    public Msg getMsg(Msg msg){
        //补全msg的id
        if(StringUtils.isNoneBlank(msg.getId())){
            msg.setId(msg.getId());
        }else{
            //补全id
//            int num = noteMapper.findMaxById();
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHms");
            String datestr = sdf.format(date);
            int num = (int) (Math.random()*10000);
            String str = String.valueOf(num);
            int sub = (int) (Math.random()*8);
            str = datestr+str;
            str = str.substring(sub);
            //ms00*
            String str1 = "ms00"+str;
            msg.setId(str1);
        }
        return msg;

    }

    /**
     * 保存回复消息Msg
     * @param msg
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveMsg(Msg msg){
        msgMapper.insert(msg);
        Msg msg1 = msgMapper.findOne(msg.getId());
        if(msg1!=null){
            return true;
        }
        return false;
    }

    /**
     * 替换保存数据html
     * @param msg
     * @return
     */
    public Msg changeMsg(Msg msg){
        if(StringUtils.isNoneBlank(msg.getMsg())){
            String str = msg.getMsg();
            str = str.replace("&lt;","<");
            str = str.replace("&quot;","\"");
            str = str.replace("&qpos;","\'");
            str = str.replace("&gt;",""+'>');
            str = str.replace("&amp;","&");
            str = str.replace("/>","style=\"max-width:300px; max-height:280px\"/>");
            str = str.replace(".gif\" border=\"0\" alt=\"\" style=\"width:300px;height:280px\"/>",".gif\" border=\"0\" alt=\"\" />");
            msg.setMsg(str);
            System.out.println(str);
        }
        return msg;
    }

    /**
     *
     * @param content
     * @return
     */
    public Note changNote(Note note,String content){
        if(StringUtils.isNoneBlank(content)){
            content = content.replace("&lt;","<");
            content = content.replace("&quot;","\"");
            content = content.replace("&qpos;","\'");
            content = content.replace("&gt;",""+'>');
            content = content.replace("&amp;","&");
            content = content.replace("/>","style=\"max-width:800px; max-height:600px\"/>");
            content = content.replace(".gif\" border=\"0\" alt=\"\" style=\"width:800px;height:600px\"/>",".gif\" border=\"0\" alt=\"\" />");
            note.setContent(content);
            System.out.println(content);
        }
        return note;
    }

    /**
     * 新增msg时自动楼层+1
     * @param msg
     * @return
     */
    public Msg getLou(Msg msg){
        if(StringUtils.isNoneBlank(msg.getNoteid())){
           List<Msg> list =  msgMapper.findAllBynoteid(msg.getNoteid());
            if(list.size()>0){
                int a = msgMapper.findMaxLou(msg.getNoteid());
                a+=1;
                msg.setLou(a);
            }else{
                msg.setLou(1);
            }

        }
        return msg;
    }

    /**
     * 更新note
     * @param note
     */
    @Transactional(readOnly = false)
    public void updateNote(Note note){
        if(note!=null){
            noteMapper.update(note);
        }

    }

    /**
     * 补全note
     * @param note
     * @return
     */
    public Note getNote(String title,Note note,String operate) throws ParseException {
        if(StringUtils.isBlank(operate)){
            //补全id
//            int num = noteMapper.findMaxById();
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHms");
            String datestr = sdf.format(date);
            int num = (int) (Math.random()*10000);
            String str = String.valueOf(num);
            int sub = (int) (Math.random()*8);
            str = datestr+str;
            str = str.substring(sub);
            //tz00*
            String str1 = "tz00"+str;
            note.setId(str1);
        }else{
            if(StringUtils.isNoneBlank(title)){
                Note note1 = findNoteByTitle(title);
                note.setId(note1.getId());
            }
        }
        //补全date
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String datestr = sdf.format(date);
        date = sdf.parse(datestr);
        note.setPostdate(date);
        //帖子状态 ，0--展示，1--删除，2--强制下线
        note.setState(0);
        //设置帖子浏览人数，默认为0，每浏览一次+1
        note.setNum(0);
        //设置帖子删除标记
        note.setDel_flag(0);
        return note;
    }

    /**
     * 保存note
     * @param note
     * @return
     */
    @Transactional(readOnly = false)
    public boolean saveNote(Note note){
        if(note!=null){
            if(StringUtils.isNoneBlank(note.getId())){
                Note  note1 = noteMapper.findOne(note.getId());
                if(note1!=null){
                    noteMapper.update(note);
                    return true;
                }
            }
        }
        noteMapper.insert(note);
        Note note1 = noteMapper.findOne(note.getId());
        if(note1!=null){
            return true;
        }
        return false;
    }

    /**
     * 根据title查找note
     * @param title
     * @return
     */
    public Note findNoteByTitle(String title){
        Note note = noteMapper.findNoteByTitle(title);
        return  note;
    }


    /**
     * 删除note根据id,并且一并删除关联的msg
     * @param id
     * @return
     */
    @Transactional(readOnly = false)
    public boolean removeNote(String id){
        if (StringUtils.isNoneBlank(id)){
            Note note = noteMapper.findOne(id);
            if (note!=null){
                note.setDel_flag(1);
                noteMapper.update(note);
                List<Msg> list = msgMapper.findAllBynoteid(note.getId());
                if (list!=null && list.size()>0){
                    for(Msg msg:list){
                        msg.setDelFlag(1);
                        msgMapper.update(msg);
                    }
                }
                return true;
            }
        }
        return false;
    }


    /**
     * 从数据中删除回复信息
     * @param msg
     * @return
     */
    @Transactional(readOnly = false)
    public boolean RemoveMsg(Msg msg){
        if (msg!=null){
            Msg msg1 = msgMapper.findOne(msg.getId());
            if (msg1!=null){
                msgMapper.delete(msg);
                Msg msg2 = msgMapper.findOne(msg.getId());
                if (msg2!=null){
                    return false;
                }else{
                    return true;
                }
            }else{
                return false;
            }
        }
        return false;
    }



    /*************************************************以下管理员操作*******************************************************/

    /**
     * 根据管理员对帖子操作，进行更新帖子，并且插入一条通知
     * @param admininfo
     * @param note
     * @param rank
     * @param op
     * @param yy
     * @return
     */
    @Transactional(readOnly = false)
    public boolean updateNoteandSaveSn(Admininfo admininfo, Note note, String rank, String op, String yy){
        if (note!=null){
            if (StringUtils.isNoneBlank(op) && admininfo!=null &&StringUtils.isNoneBlank(yy)){
                if (StringUtils.isNoneBlank(rank)){
                        if ("1".equals(rank)){
                            //展示
                            note.setState(0);
                        }else if ("2".equals(rank)){
                            //驳回
                            note.setState(2);
                        }else if ("3".equals(rank)){
                            //整改
                            note.setState(1);
                        }else if ("4".equals(rank)){
                            //删除
                            note.setDel_flag(1);

                            List<Msg> list = msgMapper.findAllBynoteid(note.getId());
                            if (list!=null&&list.size()>0){
                                for(Msg msg1 :list){
                                    msg1.setDelFlag(1);
                                    msgMapper.update(msg1);
                                }
                            }
                        }
                    noteMapper.update(note);
                   if (admininfo!=null){
                        Sysnotice sysnotice = sysnoticeService.getSysnoticeByAdminNote(admininfo,note,op,yy);
                       if (sysnotice!=null){
                         boolean flag  =  sysnoticeService.saveSysnotice(sysnotice);
                           if (flag){
                               return true;
                           }
                       }
                   }
                }
            }
        }
        return  false;
    }


    /**
     * 查询所有帖子
     * @return
     */
    public MiniPage findDeleteAll(MiniPage mp,Note n){
        Page<Note> page = new Page<Note>();
        page.setPageNo(mp.getPageNo() + 1);
        page.setPageSize(mp.getPageSize());

        if("num".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }else if("postdate".equals(mp.getSortField())){
            page.setOrderBy("t."+mp.getSortField()+" "+mp.getSortOrder());
        }
        System.out.println("t."+mp.getSortField()+" "+mp.getSortOrder());
        n.setPage(page);
        List<Note> list = noteMapper.findDelete(n);
        if(list.size()!=0){
            for (Note note :list){
                if (StringUtils.isNoneBlank(note.getContent())){
                    String str = note.getContent();
                    str = str.replace("style=\"max-width:800px; max-height:600px\"/>","style=\"max-width:50px; max-height:40px\"/>");
                    note.setContent(str);
                }

            }
            mp.setTotal(page.getCount());
            mp.setData(list);
        }
        return mp;
    }


    /**
     * 查询最近帖子回复5条
     * @return
     */
    public List<Msg> findLastMsgs(){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Msg> list = msgMapper.findLast();
        if (list!=null&&list.size()>0){
            for(Msg msg:list){
                if (msg.getCreateDate()!=null){
                    msg.setCreateDateStr(sdf.format(msg.getCreateDate()));
                }
                if (StringUtils.isNoneBlank(msg.getUid())){
                    User user = userMapper.findOne(msg.getUid());
                    if (user!=null){
                        msg.setUname(user.getUname());
                    }
                }
                if (StringUtils.isNoneBlank(msg.getMsg())){
                    String str = msg.getMsg();
                    str = str.replace("style=\"max-width:300px; max-height:280px\"/>","style=\"max-width:50px; max-height:50px\"/>");
                    str = str.replace(".gif\" border=\"0\" alt=\"\" style=\"max-width:50px; max-height:50px\"/>",".gif\" border=\"0\" alt=\"\" />");
                    msg.setMsg(str);
                }
            }
            return list;
        }
        return  null;
    }


    /**
     * 查找被删除的note根据id
     * @param id
     * @return
     */
    public Note findDeleteOne(String id){
        if (StringUtils.isNoneBlank(id)){
            Note note = noteMapper.findDeleteOne(id);
            if (note!=null){
                return  note;
            }
        }
        return  null;
    }


    /**
     * 回收被删除的note
     * @param note
     * @return
     */
    @Transactional(readOnly = false)
    public boolean rebackNote(Note note){
        if (note!=null){
            //查找被删除的
            List<Msg> list = msgMapper.findAllDeleteByNoteid(note.getId());
            if (list!=null && list.size()>0){
                for(Msg msg :list){
                    msg.setDelFlag(0);
                    msgMapper.update(msg);
                }
            }
            noteMapper.update(note);
            return true;
        }
        return  false;
    }

    /**
     * 从数据库删除回收站的note
     * @param note
     * @return
     */
    @Transactional(readOnly = false)
    public boolean RealDeleteNote(Note note){
        if (note!=null){
            Note note1 = this.findDeleteOne(note.getId());
            if (note1!=null){
                List<Msg> list = msgMapper.findAllDeleteByNoteid(note.getId());
                noteMapper.delete(note);
                Note note2 = this.findDeleteOne(note.getId());
                if (note2!=null){
                    return false;
                }else{
                    if (list!=null && list.size()>0){
                        for (Msg msg:list){
                            msgMapper.delete(msg);
                        }
                    }
                    List<Msg> list1 = msgMapper.findAllDeleteByNoteid(note.getId());
                    if (list1.size()==0){
                        return true;
                    }
                }
            }
        }
        return  false;
    }

    /**
     * 根据id进行查找Msg
     * @param id
     * @return
     */
    public Msg findMsgByid(String id){
        if (StringUtils.isNoneBlank(id)){
            Msg msg = msgMapper.findOne(id);
            if (msg!=null){
                return msg;
            }
        }
        return null;
    }

    /**
     * 删除Msg
     * @param msg
     * @return
     */
    @Transactional(readOnly = false)
    public boolean removeMsg(Msg msg){
        if (msg!=null){
            Msg msg1 = msgMapper.findOne(msg.getId());
            if (msg1!=null){
                msgMapper.delete(msg);
                Msg msg2 = msgMapper.findOne(msg.getId());
                if (msg2!=null){
                    return  false;
                }else {
                    return  true;
                }
            }
        }
        return  false;
    }

    /**
     * 获取帖子数目（有效帖子）
     * @return
     */
    public Integer getNoteNum(){
        List<Note> list = noteMapper.find(null);
        if (list!=null && list.size()>=0){
            return list.size();
        }
        return null;
    }

}
