��# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
 #  
 #   N A M E :   R e p o r t s - V M w a r e . p s 1  
 #  
 #   A U T H O R :     S a t y a j i t   R o y  
 #  
 #   C O M M E N T :   G e t   C a p a c i t y   R e p o r t   f r o m   A L L   D C s   -   V M w a r e  
 #  
 #   V E R S I O N   H I S T O R Y :  
 #   1 . 0   1 1 / 2 0 / 2 0 1 3   -   I n i t i a l   r e l e a s e  
 #  
 # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #  
  
 #   V a r i a b l e s  
 $ d t = G e t - D a t e   - u f o r m a t   % b - % d - % Y  
 $ C h a r t T y p e   =   " x l B a r "  
 $ x l A u t o m a t i c   =   - 4 1 0 5  
 $ x l B o t t o m   =   - 4 1 0 7  
 $ x l C e n t e r   =   - 4 1 0 8  
 $ x l C o n t e x t   =   - 5 0 0 2  
 $ x l C o n t i n u o u s   =   1  
 $ x l D i a g o n a l D o w n   =   5  
 $ x l D i a g o n a l U p   =   6  
 $ x l E d g e B o t t o m   =   9  
 $ x l E d g e L e f t   =   7  
 $ x l E d g e R i g h t   =   1 0  
 $ x l E d g e T o p   =   8  
 $ x l I n s i d e H o r i z o n t a l   =   1 2  
 $ x l I n s i d e V e r t i c a l   =   1 1  
 $ x l N o n e   =   - 4 1 4 2  
 $ x l T h i n   =   2    
  
 $ D C s   =   ( ' m 1 v c 0 0 1 .example.com' ,   ' m 3 v c 0 0 1 .example.com' ,   ' m 5 v c 0 0 1 .example.com' )  
 $ x l X L S   =   5 6  
 $ x l s f i l e   =   " C : \ T e m p \ V M w a r e - C a p x - R e p o r t - $ d t . x l s "  
  
 $ E x c e l   =   N e w - O b j e c t   - C o m O b j e c t   E x c e l . A p p l i c a t i o n  
 $ E x c e l . v i s i b l e   =   $ f a l s e  
 $ E x c e l   =   $ E x c e l . W o r k b o o k s . A d d ( )  
  
 $ S h e e t   =   $ E x c e l . W o r k s h e e t s . I t e m ( 1 )  
 $ S h e e t . C e l l s . I t e m ( 4 , 1 )   =   " N o .   O f   v H o s t "  
 $ S h e e t . C e l l s . I t e m ( 5 , 1 )   =   " N o .   O f   V M s "  
 $ S h e e t . C e l l s . I t e m ( 6 , 1 )   =   " N o .   o f   T e m p l a t e s "  
 $ S h e e t . C e l l s . I t e m ( 7 , 1 )   =   " N o .   o f   C l u s t e r s "  
 $ S h e e t . C e l l s . I t e m ( 8 , 1 )   =   " N o .   o f   D a t a s t o r e s "  
 $ S h e e t . C e l l s . I t e m ( 9 , 1 )   =   " N o .   o f   A c t i v e   V M s "  
 $ S h e e t . C e l l s . I t e m ( 1 0 , 1 )   =   " N o .   o f   I n a c t i v e   V M s "  
  
 $ i n t r o w   =   3  
 $ i n t c o l   =   2  
  
 $ S h e e t . C e l l s . I t e m ( 1 , 1 ) =   ' V M w a r e   C a p a c i t y   R e p o r t '  
 $ r a n g e   =   $ S h e e t . R a n g e ( " a 1 " , " g 2 " )  
 $ r a n g e . S t y l e   =   ' T i t l e '  
 $ r a n g e . S e l e c t ( )  
 $ r a n g e . M e r g e C e l l s   =   $ t r u e  
 $ r a n g e . H o r i z o n t a l A l i g n m e n t   =   $ x l C e n t e r  
  
 $ W o r k B o o k   =   $ S h e e t . U s e d R a n g e  
 $ W o r k B o o k . I n t e r i o r . C o l o r I n d e x   =   1 9  
 $ W o r k B o o k . F o n t . C o l o r I n d e x   =   1 1  
 $ W o r k B o o k . F o n t . B o l d   =   $ T r u e  
 $ W o r k B o o k . B o r d e r s . I t e m ( $ x l I n s i d e H o r i z o n t a l ) . W e i g h t   =   $ x l T h i n  
 $ W o r k B o o k . B o r d e r s . I t e m ( $ x l I n s i d e V e r t i c a l ) . W e i g h t   =   $ x l T h i n  
 $ W o r k B o o k . B o r d e r s . I t e m ( $ x l I n s i d e H o r i z o n t a l ) . L i n e S t y l e   =   $ x l C o n t i n u o u s  
 $ W o r k B o o k . B o r d e r s . I t e m ( $ x l I n s i d e V e r t i c a l ) . L i n e S t y l e   =   $ x l C o n t i n u o u s  
 $ W o r k B o o k . B o r d e r s . I t e m ( $ x l E d g e L e f t ) . L i n e S t y l e   =   $ x l C o n t i n u o u s  
 $ W o r k B o o k . B o r d e r s . I t e m ( $ x l E d g e B o t t o m ) . L i n e S t y l e   =   $ x l C o n t i n u o u s  
  
 $ S h e e t . C e l l s . I t e m ( 3 ,   1 )   =   ' v C e n t e r s '  
 #   F o r   W T ,   S A C ,   S y d n e y   D C  
  
 f o r e a c h   ( $ v C e n t e r   i n   $ D C s )   {  
 	 C o n n e c t - V I S e r v e r   $ v C e n t e r   - U s e r   U s e r n a m e   - P a s s w o r d   P a s s w o r d  
 	 	 $ S h e e t . C e l l s . I t e m ( 3 ,   $ i n t c o l )   =   $ v C e n t e r    
 	 	 $ v h o s t   =   ( G e t - V M H o s t   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 4 ,   $ i n t c o l )   =   $ v h o s t . C o u n t  
 	 	 $ V M s   =   ( G e t - V M   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 5 ,   $ i n t c o l )   =   $ V M s . C o u n t  
 	 	 $ v T e m p l a t e   =   ( G e t - T e m p l a t e   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 6 ,   $ i n t c o l )   =   $ v T e m p l a t e . C o u n t  
 	 	 $ v C l u s t e r   =   ( G e t - C l u s t e r   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 7 ,   $ i n t c o l )   =   $ v C l u s t e r . C o u n t  
 	 	 $ v D a t a s t o r e   =   ( G e t - D a t a s t o r e   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 8 ,   $ i n t c o l )   =   $ v D a t a s t o r e . C o u n t  
 	 	 $ A c t i v e V M s   =   ( G e t - V M   |   W h e r e - O b j e c t   {   $ _ . P o w e r S t a t e   - e q   " P o w e r e d O n "   } |   m e a s u r e   )  
 	 	 $ S h e e t . C e l l s . I t e m ( 9 ,   $ i n t c o l )   =   $ A c t i v e V M s . C o u n t  
 	 	 $ I n a c t i v e V M s   =   ( G e t - V M   |   W h e r e - O b j e c t   {   $ _ . P o w e r S t a t e   - e q   " P o w e r e d O f f "   } |   m e a s u r e   )  
 	 	 $ S h e e t . C e l l s . I t e m ( 1 0 ,   $ i n t c o l )   =   $ I n a c t i v e V M s . C o u n t  
 	 D i s c o n n e c t - V I S e r v e r   - S e r v e r   $ v C e n t e r   - C o n f i r m : $ f a l s e  
 $ i n t c o l   =   $ i n t c o l   +   1   }  
  
 # F o r   C a r p a t h i a   D a l l u s ,   A M S  
  
 $ D C s   =   ( ' v C e n t e r 1 ' ,   ' v C e n t e r 2 ' ,   ' v C e n t e r 3 ' )  
 $ i n t c o l   =   5  
 f o r e a c h   ( $ v C e n t e r   i n   $ D C s )   {  
 # V a r i a b l e  
 	 C o n n e c t - V I S e r v e r   $ v C e n t e r   - U s e r   U s e r n a m e   - P a s s w o r d   ' P a s s w o r d '  
 	 	 $ S h e e t . C e l l s . I t e m ( 3 ,   $ i n t c o l )   =   $ v C e n t e r    
 	 	 $ v h o s t   =   ( G e t - V M H o s t   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 4 ,   $ i n t c o l )   =   $ v h o s t . C o u n t  
 	 	 $ V M s   =   ( G e t - V M   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 5 ,   $ i n t c o l )   =   $ V M s . C o u n t  
 	 	 $ v T e m p l a t e   =   ( G e t - T e m p l a t e   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 6 ,   $ i n t c o l )   =   $ v T e m p l a t e . C o u n t  
 	 	 $ v C l u s t e r   =   ( G e t - C l u s t e r   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 7 ,   $ i n t c o l )   =   $ v C l u s t e r . C o u n t  
 	 	 $ v D a t a s t o r e   =   ( G e t - D a t a s t o r e   |   m e a s u r e )  
 	 	 $ S h e e t . C e l l s . I t e m ( 8 ,   $ i n t c o l )   =   $ v D a t a s t o r e . C o u n t  
 	 	 $ A c t i v e V M s   =   ( G e t - V M   |   W h e r e - O b j e c t   {   $ _ . P o w e r S t a t e   - e q   " P o w e r e d O n "   } |   m e a s u r e   )  
 	 	 $ S h e e t . C e l l s . I t e m ( 9 ,   $ i n t c o l )   =   $ A c t i v e V M s . C o u n t  
 	 	 $ I n a c t i v e V M s   =   ( G e t - V M   |   W h e r e - O b j e c t   {   $ _ . P o w e r S t a t e   - e q   " P o w e r e d O f f "   } |   m e a s u r e   )  
 	 	 $ S h e e t . C e l l s . I t e m ( 1 0 ,   $ i n t c o l )   =   $ I n a c t i v e V M s . C o u n t  
 	 D i s c o n n e c t - V I S e r v e r   - S e r v e r   $ v C e n t e r   - C o n f i r m : $ f a l s e  
 $ i n t c o l   =   $ i n t c o l   +   1   }  
  
 #   S t a t i c a l l y   P r o v i d i n g   t h e   V c e n t e r   N a m e  
 $ S h e e t . C e l l s . I t e m ( 3 ,   2 )   =   ' D C 1 '  
 $ S h e e t . C e l l s . I t e m ( 3 ,   3 )   =   ' D C 2 '  
 $ S h e e t . C e l l s . I t e m ( 3 ,   4 )   =   ' D C 3 '  
 $ S h e e t . C e l l s . I t e m ( 3 ,   5 )   =   ' D C 4 '  
 $ S h e e t . C e l l s . I t e m ( 3 ,   6 )   =   ' D C 5 '  
 $ S h e e t . C e l l s . I t e m ( 3 ,   7 )   =   ' D C 6 '  
 #   A u t o f i t t i n g   t h e   E x c e l   S h e e t  
 $ W o r k B o o k . E n t i r e C o l u m n . A u t o F i t ( )  
 $ W o r k B o o k . N a m e   =   ' I n v e n t o r y '  
  
 #   H e a d e r   f o r   C h a r t  
  
 $ S h e e t . C e l l s . I t e m ( 1 8 , 1 ) =   ' G r a p h i c a l   R e p r e s e n t a t i o n '  
 $ r a n g e   =   $ S h e e t . R a n g e ( " a 1 8 " , " g 2 0 " )  
 $ r a n g e . S t y l e   =   ' T i t l e '  
 $ r a n g e . S e l e c t ( )  
 $ r a n g e . M e r g e C e l l s   =   $ t r u e  
 $ r a n g e . H o r i z o n t a l A l i g n m e n t   =   $ x l C e n t e r  
 $ c h a r t   =   $ S h e e t . S h a p e s . a d d C h a r t ( ) . c h a r t  
 $ c h a r t . h a s T i t l e   =   $ t r u e  
 $ c h a r t . c h a r t T i t l e . t e x t   =   " V M w a r e   C a p a c i t y   C h a r t "  
 $ c h a r t T y p e   =   [ M i c r o s o f t . O f f i c e . I n t e r o p . E x c e l . X l C h a r t T y p e ] : : x l B a r  
 $ c h a r t . c h a r t T y p e   =   $ c h a r t T y p e  
 $ s t a r t C e l l   +   " ,   "   +   $ e n d C e l l  
 $ d a t a r a n g e   =   $ S h e e t . R a n g e ( " A 3 : F 1 0 " )  
 $ c h a r t . S e t S o u r c e D a t a ( $ d a t a r a n g e )  
 $ c h a r t . S e r i e s C o l l e c t i o n ( ) . N e w S e r i e s . I n v o k e ( )  
 $ S h e e t . s h a p e s . i t e m ( " C h a r t   1 " ) . t o p = 3 4 0  
 $ S h e e t . s h a p e s . i t e m ( " C h a r t   1 " ) . l e f t = 1 0 0  
 $ S h e e t . S a v e A s ( $ x l s f i l e )  
 $ E x c e l . C l o s e ( $ x l s f i l e )  
 S t o p - P r o c e s s   - N a m e   " E x c e l "  
  
 [ S y s t e m . R u n t i m e . I n t e r o p S e r v i c e s . M a r s h a l ] : : R e l e a s e C o m O b j e c t ( [ S y s t e m . _ _ C o m O b j e c t ] $ E x c e l )   |   O u t - N u l l  
  
 i f   ( $ x l s f i l e   - n e   " " ) {  
         $ S m t p C l i e n t   =   N e w - O b j e c t   s y s t e m . n e t . m a i l . s m t p C l i e n t  
         $ S m t p C l i e n t . h o s t   =   " m 1 s m t p 0 0 1 .example.com"       # C h a n g e   t o   a   S M T P   s e r v e r   i n   y o u r   e n v i r o n m e n t  
         $ M a i l M e s s a g e   =   N e w - O b j e c t   N e t . m a i l . m a i l m e s s a g e  
 	 $ M a i l A t t a c h m e n t   =   N e w - O b j e c t   N e t . M a i l . A t t a c h m e n t ( $ x l s f i l e )  
         $ M a i l M e s s a g e . f r o m   =   " S y s t e m . A u t o m a t i o n @ e x a m p l e . c o m "       # C h a n g e   t o   e m a i l   a d d r e s s   y o u   w a n t   e m a i l s   t o   b e   c o m i n g   f r o m  
         $ M a i l M e s s a g e . T o . a d d ( " a d m i n @ e x a m p l e . c o m " )         # C h a n g e   t o   e m a i l   a d d r e s s   y o u   w o u l d   l i k e   t o   r e c e i v e   e m a i l s .  
         $ M a i l M e s s a g e . I s B o d y H t m l   =   1  
         $ M a i l M e s s a g e . S u b j e c t   =   " V M w a r e   C a p a c i t y   R e p o r t "  
 	 $ M a i l M e s s a g e . A t t a c h m e n t s . A d d ( $ M a i l A t t a c h m e n t )  
         $ M a i l M e s s a g e . B o d y   =   " P l e a s e   f i n d   t h e   v C e n t e r   C a p a c i t y   R e p o r t   f r o m   A L L   D C s "  
         $ S m t p C l i e n t . S e n d ( $ M a i l M e s s a g e ) }  
 e l s e   {  
 	 $ S m t p C l i e n t   =   N e w - O b j e c t   s y s t e m . n e t . m a i l . s m t p C l i e n t  
         $ S m t p C l i e n t . h o s t   =   " s m t p 0 0 1 . e x a m p l e . c o m "       # C h a n g e   t o   a   S M T P   s e r v e r   i n   y o u r   e n v i r o n m e n t  
         $ M a i l M e s s a g e   =   N e w - O b j e c t   s y s t e m . n e t . m a i l . m a i l m e s s a g e  
 	 $ M a i l M e s s a g e . f r o m   =   " S y s t e m . A u t o m a t i o n @ e x a m p l e . c o m "  
 	 $ M a i l M e s s a g e . T o . a d d ( " a d m i n @ e x a m p l e . c o m " )         # C h a n g e   t o   e m a i l   a d d r e s s   y o u   w o u l d   l i k e   t o   r e c e i v e   e m a i l s .  
         $ M a i l M e s s a g e . I s B o d y H t m l   =   1  
         $ M a i l M e s s a g e . S u b j e c t   =   " V M w a r e   C a p a c i t y   R e p o r t "  
 	 $ M a i l M e s s a g e . B o d y   =   " R e p o r t   i s   n o t   g e n e r a t e d ,   P l e a s e   v e r i f y "  
         $ S m t p C l i e n t . S e n d ( $ M a i l M e s s a g e ) } 
