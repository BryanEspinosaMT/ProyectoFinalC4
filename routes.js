const express=require('express')
const routes=express.Router()

///select------------------obtener

routes.get('/:table',(req,res)=>{
    //res.send('Aquí si es el select')
    req.getConnection((err,conn)=>{
        if(err) return res.send(err)
        
        var ssql='select * from '+req.params.table

        conn.query(ssql,(err,rows)=>{
            if(err) return res.send(err)

            res.json(rows)
        })

    })
})
 
///-----------------------insertar
routes.post('/:table',(req,res)=>{
    //res.send('Aquí si es el select')
    req.getConnection((err,conn)=>{
        if(err) return res.send(err)

        let sql = 'INSERT INTO ' + req.params.table + ' set ?'

        conn.query(sql,[req.body],(err,rows)=>{
            if(err) return res.send(err)

            res.json('Add OK')
        })

    })
})

//// route for delete
routes.delete('/:table/:field/:id',(req,res)=>{    
    req.getConnection((err,conn)=>{     
     if(err) return res.send(err)  
     
     let sql = 'DELETE FROM ' + req.params.table+  ' WHERE ' + req.params.field + '= ?'
     conn.query(sql,[req.params.id],(err,rows)=>{
         if(err) return res.send(err) 
         res.send('delete OK!')
     })
 
    })
 })
 
  // route for update
  routes.put('/:table/:field/:id',(req,res)=>{    
    req.getConnection((err,conn)=>{     
     if(err) return res.send(err)
     
     let sql='UPDATE ' + req.params.table + ' set ? WHERE '+ req.params.field + ' = ?'
     
     conn.query(sql,[req.body,req.params.id],(err,rows)=>{
         if(err) return res.send(err) 
         res.send(' UPDATED OK!')
     })
 
    })
 })

module.exports=routes