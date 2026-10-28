;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// рисование экрана кабеля, для спвп, посзе знака кабеля        //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:07-shld-cble-case-1-mtext

( / adoc counter crl-1 crl-2 htch-1 lin-1 lin-2 pnt-ins pnt-mtxt tmp-celtscale txt-1 x-pnt-ins y-pnt-ins)

(vl-load-com)

(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)));setq
);start undo

(setvar "cmdecho" 0)

(setvar "osmode" 0)

(if (= (tblsearch "ltype" "acad_iso02w100" t) nil)
	(command "_.linetype" "_l" "acad_iso02w100" "acadiso.lin" "")
);if

(setq counter 0
			tmp-celtscale (getvar "celtscale")  ;получаем текущее значение масштаба
);setq

(if (= (tblsearch "block" "экран-кабеля-1-спвп") nil)
	(progn
		(setvar "celtype" "acad_iso02w100");новый тип линии
		
    (setvar "celtscale" 0.1);новое значение масштаба
    
    (command "_circle" (list 0 -5) 1)
    
    (setq crl-1 (entlast))

		(setvar "celtscale" tmp-celtscale);возвращаем настройки
		
    (setvar "celtype" "Bylayer")
    
    (command "_line" '(0 0) '(0 -10) "")

		(setq lin-1 (entlast))
		
		(command "_pline" '(1 -5) "_w" 0 0 '(5 -5) "_w" 1.5 0 '(8 -5) "")
		
		(setq lin-2 (entlast))
		
		(command "_text" "_bl" '(1.5 -5) 2.5 0 "PE")
		
		(setq txt-1 (entlast))
		
		(command "_circle" (list 1 -5) 0.5)
    
    (setq crl-2 (entlast))
    
    (command "_hatch" "solid" crl-2 "")
    
    (setq htch-1 (entlast))
			
		(command "_block" "экран-кабеля-1-спвп" '(0 0) crl-1 crl-2 lin-1 lin-2 txt-1 htch-1 "");command
	);progn
);if

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку\n")) nil)
  (progn
    (setq x-pnt-ins (nth 0 pnt-ins)
    	    y-pnt-ins (nth 1 pnt-ins)
    	    
    	    pnt-mtxt (list x-pnt-ins (- y-pnt-ins 11))
    );setq
    
    (setvar "osmode" 0)
    
    (command "_insert" "экран-кабеля-1-спвп" "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
    
    (setq txt-1 (entmakex
    	(list
      	'(0 . "MTEXT")
      	'(100 . "AcDbEntity")
      	'(100 . "AcDbMText")
       	(cons 10 pnt-mtxt) ;нач точка
      	'(1 . "*******") ;содержание
      	'(40 . 2.5) ;высота
      	'(41 . 16) ;растяжение
      	'(42 . 16) ;ширина
       	(cons 50 (angtof "0" 0)) ;поворо
       	(cons 71 2) ;выравнивание
      	'(370 . -1) ;толщина
       	(cons 7 (getvar "textstyle")) ;стиль
    	);list
    );entmakex
    );setq
    
  );progn
  
 (setvar "osmode" 6199)
);while


(vla-endundomark adoc)
(princ)
)
;///////////////////////////////////////////////////////// конец программы /////////////////////////////////////////////////////////////////
