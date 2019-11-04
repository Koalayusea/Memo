package jee.support.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@Accessors(chain = true)
public class Note {
    private long noteId;
    private String name;
    private String type;
    private String date;
    private Date dateCreated;
    private String body;
    User user;
}
