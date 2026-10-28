;///////// ИМ закрывает РО ///////////////////////////////////////////////////////////////////
(defun c:03-execut-mech-close-regul

( / angl name-block pnt-drctn pnt-ins)

(command "_.undo" "_begin")

(setvar "osmode" 6199)
(setvar "cmdecho" 0)

(setq	pnt-ins			(getpoint "\nУкажите точку вставки\n")
			pnt-drctn		(getpoint "\nУкажите точку направления\n")
			angl				(atoi (angtos (angle pnt-ins pnt-drctn)))
			name-block "эим-норм-закр-им-са"
);setq

(setvar "osmode" 0)

(if	(= (tblsearch "block" name-block) nil)
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
    (command "_pline" '(0 10) "_w" 0 0 '(0 4) "_w" 2 0 '(0 0) "")
		(setq lin-1 (entlast))
		(command "_circle" '(0 12.5) 2.5)
		(setq circle-1 (entlast))
		
		(command "_arc" '(0 12.5) "_C" '(-1 12.5) '(-2 12.5) "")
		(setq arc-1 (entlast))
		(command "_arc" '(0 12.5) "_C" '(1 12.5) '(2 12.5) "")
		(setq arc-2 (entlast))
			
		(command "_block" name-block '(0 0)
		  circle-1 lin-1 arc-1 arc-2
		"");command
  ) ; конец progn
);if	

; опеределяем угол поворота
(cond
  ; вниз
  ((and  
    (<= angl 315)
		(>= angl 225)
	 );and
    (setq angl-blck 0
    ); end setq
  ); end условия
  
  ; влево
  ((and
    (<= angl 225)
		(>= angl 135)
   );and
    (setq angl-blck 90
    );setq
	);end условия
	
  ; вверх
  ((and
    (<= angl 135)
    (>= angl 45)
   );and
    (setq angl-blck 0
    ); end setq
	); end условия  	
	  
  ; вправо	
	(progn													
			(setq angl-blck 270
			); end setq
	);progn
); end cond

(setvar "osmode" 0)
(command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)
(command "_.undo" "_end")

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////