package com.springapp.mvc.dao;

import java.util.List;
import org.hibernate.criterion.Criterion;

public interface HbmDAO <T, pk> {

    public void add(T t);
    public T getById(Class entityClass, pk id);
    public T getByUrl(Class entityClass, pk url);
    public T getByName(Class entityClass, pk name);
    public List<T> getAll(Class entityClass);
    public List<T> getAll(Class entityClass, List<Criterion> restrictions);
    public void update(T t);
    public void delete(T t);
    public List getListFromSearch(Class entityClass, String word);

}
