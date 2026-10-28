;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// Блок клапанный вентильный с продувкой                        /////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:05-pls-valve-block-1-valve-with-purge

( / adoc angl angl-blck angl-lin-1 angl-lin-2 blck-name block-1 lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 pi pnt-drctn pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "cmdecho" 0)

(setq blck-name "блок-вентильный-1-вент-с-продувкой-ссвп");setq

(if	(= (tblsearch "block" blck-name) nil);создаем блок
  (progn
    (setvar "osmode" 0)
    (command "_line" '(-1.5 0) '(1.5 0) "");вертик кран
		(setq lin-1 (entlast))
		(command "_line" '(-1.5 6) '(1.5 6) "")
		(setq lin-2 (entlast))
		(command "_line" '(-1.5 0) '(1.5 6) "")
		(setq lin-3 (entlast))
		(command "_line" '(1.5 0) '(-1.5 6) "")
		(setq lin-4 (entlast))
		
		(command "_line" '(0.75 1.5) '(3 1.5) "");дренаж
		(setq lin-5 (entlast))
		(command "_line" '(3 0.5) '(3 2.5) "")
		(setq lin-6 (entlast))
    
		(command "_block" blck-name '(0 0) lin-1 lin-2 lin-3 lin-4 lin-5 lin-6 "");command
  );progn
);if

(setvar "osmode" 6199)

(while (/= (setq pnt-ins (getpoint "\nУкажите точку вставки\n")) nil)
  (setq pnt-drctn	 (getpoint "\nУкажите точку направления\n")
	  		angl (atoi (angtos (angle pnt-ins pnt-drctn) 1))
  );setq
  
	(cond
		((and (< angl 135) (> angl 45)) ;вверх
			(setq angl-blck 0);setq
		);=

		((and (<= angl 225) (>= angl 135)) ;влево
			(setq angl-blck 90);setq
		);=

		((and (< angl 315) (> angl 225)) ;вниз
			(setq angl-blck 180);setq
		);=

		((or (>= angl 315) (<= angl 45)) ;вправо
			(setq angl-blck 270);setq
		);=
	);cond
  
  (setvar "osmode" 0)
  
  (command "_insert" blck-name "_X" 1 "_Y" 1 "_Z" 1 "_R" angl-blck pnt-ins)
  
  (setvar "osmode" 6199)
);while

(setvar "cmdecho" 1)
(setvar "osmode" 6199)
(vla-endundomark adoc)
(princ)
)

;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////

