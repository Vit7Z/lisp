;///////// ИМ соленоид ///////////////////////////////////////////////////////////////////
(defun c:03-execut-mech-solenoid-invariable

( / angl angl-blck line-1 name-block pnt-drctn pnt-ins rctn-1 txt-1)

(command "_.undo" "_begin")

(setvar "osmode" 6199)

(setq	pnt-ins (getpoint "\nУкажите точку вставки\n")
			pnt-drctn (getpoint "\nУкажите точку направления\n")
			angl (atoi (angtos (angle pnt-ins pnt-drctn)))
			name-block "эим-соленоид-неизм-са"
);setq
	
(setvar "osmode" 0)
(setvar	"CLAYER" "0")

(if	(= (tblsearch "block" name-block) nil)
  (progn
    (command "_line" '(0 0) '(0 4) "")
		(setq line-1 (entlast))
		
		(command "_RECTANGLE" '(-2 8) '(2 4))
		(setq rctn-1 (entlast))
		
		(command "_TEXT" "_MC" '(0 6) 2.5 0 "S") ; рисование текста
		(setq txt-1 (entlast))
			
		(command "_block" name-block '(0 0) line-1 rctn-1 txt-1 "");command
  );progn
);if	

;опеределяем угол поворота
(cond
  ;вниз
  ((and (<= angl 315) (>= angl 225));and
    (setq angl-blck 0);setq
  );end
  
  ;влево
  ((and (<= angl 225) (>= angl 135));and
    (setq angl-blck 90);setq
	);end
	
  ;вверх
  ((and (<= angl 135) (>= angl 45));and
    (setq angl-blck 0);setq
	);end
	  
  ;вправо
  ((or (< angl 45) (> angl 315));and
		(setq angl-blck 270);setq
	);end
);cond

(setvar "osmode" 0)
(command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" angl-blck pnt-ins)
(command "_.undo" "_end")
(setvar "osmode" 6199)
(princ)
)
;//////////////////////// конец программы ///////////////////////////////////////