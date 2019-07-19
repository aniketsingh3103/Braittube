 var slideshow =function(container){
        this.image=[];
        this.cur=0;
        
        for(var i=0;i<container.childElementCount;i++){
            this.image.push(container.children[i]);

        }
        
        
        var nextsilde=function(){
            for(var i=0;i<this.image.length;i++){
                this.image[i].style.display="none";
                
            }
            this.image[this.cur].style.display="block";
            
            this.cur++;
            if(this.cur >= this.image.length){
                this.cur=0;
            }
        
        window.setTimeout(nextsilde.bind(this),2000);
        };
        
        nextsilde.call(this);
         
    };
        
    slideshow(document.getElementById("slide"));
    
    
         var send=function(a){
             var text=document.getElementById(a);
           
           //var hrf=document.createElement('a');
           //hrf.setAttribute('href',"vedios.jsp");
           text.href="vedios.jsp?ved="+text.innerHTML;
         //window.alert(text.innerHTML);
                           } ;    