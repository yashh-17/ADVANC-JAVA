package com.example;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "tasks")
public class task {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "taskname")
    private String taskname;

    @Column(name = "description")
    private String description;

    @Column(name = "date")
    private String date;

    @Column(name = "prioritylevel")
    private String prioritylevel;

    // Constructors, getters, and setters
    
    public task() {
    }

    public task(String taskname, String description, String date, String prioritylevel) {
        this.taskname = taskname;
        this.description = description;
        this.date = date;
        this.prioritylevel = prioritylevel;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTaskname() {
        return taskname;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPrioritylevel() {
        return prioritylevel;
    }

    public void setPrioritylevel(String prioritylevel) {
        this.prioritylevel = prioritylevel;
    }
}