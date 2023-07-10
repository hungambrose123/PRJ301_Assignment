/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Warspite
 */
public class Cart {
    private List<Item> item;

    public Cart() {
        item = new ArrayList<>();
    }
    public Cart(String txt, List<Product> productList){
        item = new ArrayList<>();
        try{
          if(txt!=null && txt.length()!=0){
            String [] s = txt.split(",");
            for(String i:s){
                String[] n = i.split(":");
                int id = Integer.parseInt(n[0]);
                int quantity = Integer.parseInt(n[1]);
                Product p = getProductById(id,productList );
                Item t = new Item(p, quantity, p.getPrice()*2);
                addItem(t);
            }
        }  
        }catch(NumberFormatException e){
            System.out.println(e);
        }
        
    }
    
    private Product getProductById(int id, List<Product> productList){
        for(Product i:productList){
            if(i.getId()==id){
                return i;
            }
        }
        return null;
    }

    public List<Item> getItem() {
        return item;
    }
    
    private int getQuantityById(int id){
        return getItemByID(id).getQuantity();
    }
    
    private Item getItemByID(int id){
        for(Item i : item){
            if(i.getProduct().getId()==id){
                return i;
            }
        }
        return null;
    }
    
    private void addItem(Item t){
        if(getItemByID(t.getProduct().getId())!=null){
            Item m = getItemByID(t.getProduct().getId());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        }else{
            item.add(t);
        }
    } 
    
    private void removeItem(int id){
        if(getItemByID(id)!=null){
            item.remove(getItemByID(id));
        }
    }
    
    public double getTotalMoney(){
        double t =0;
        for(Item i: item){
            t+= i.getQuantity()*i.getPrice();
        }
        return t;
    }
}
