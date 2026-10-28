;///////// ИМ неизмен РО ///////////////////////////////////////////////////////////////////
(defun c:03-execut-mech-invariable-pos

( / angl angl-blck arc-1 arc-2 circle-1 lin-1 lin-2 lin-3 name-block pnt-drctn pnt-ins txt)

(command "_.undo" "_begin")

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			pnt-drctn (getpoint "\nУкажите точку направления\n")
			angl (atoi (angtos (angle pnt-ins pnt-drctn)))
			txt "***"
			name-block "эим-неизмен-полож-им-са"
);setq

(setvar "osmode" 0)

(if	(= (tblsearch "block" name-block) nil)
  (progn ; выполнение первого условия, блока нет, создаем и вставляем
    (command "_line" '(0 0) '(0 10) "");вертик кран
		(setq lin-1 (entlast))
		(command "_line" '(-1.5 4) '(1.5 4) "")
		(setq lin-2 (entlast))
		(command "_line" '(-1.5 6) '(1.5 6) "")
		(setq lin-3 (entlast))
		(command "_circle" '(0 12.5) 2.5)
		(setq circle-1 (entlast))
		
		(command "_arc" '(0 12.5) "_C" '(-1 12.5) '(-2 12.5) "")
		(setq arc-1 (entlast))
		(command "_arc" '(0 12.5) "_C" '(1 12.5) '(2 12.5) "")
		(setq arc-2 (entlast))
			
		(command "_block" name-block '(0 0)
		  circle-1 lin-1 lin-2 lin-3 arc-1 arc-2
		"");command
  );progn
);if

; опеределяем угол поворота
(cond
  ;вниз
  ((and (<= angl 315) (>= angl 225)) (setq angl-blck 0));условия
  
  ;влево
  ((and (<= angl 225) (>= angl 135)) (setq angl-blck 90));условия
	
  ; вверх
  ((and (<= angl 135) (>= angl 45)) (setq angl-blck 0));условия
	  
  ; вправо
	(progn													
			(setq angl-blck 270);setq
	);progn
); end cond

(setvar "osmode" 0)
(command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)
(command "_.undo" "_end")
(setvar "osmode" 6199)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////