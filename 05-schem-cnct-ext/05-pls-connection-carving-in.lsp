;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
(defun c:05-pls-connection-carving-in

( / angl angl_blck line_1 line_3 line_4 line_6 line_7 name_block pnt-drct pnt-ins txt_1)

(setvar "cmdecho" 0)

(setq name_block "соединение-Ќ—¬-ссвп");setq

;создаем слой wspom
(if (= (tblsearch "layer" "wspom") nil)
	(command "_layer" "—оздать" "wspom" "“ип" "Continuous" "wspom" "÷вет" 3 "wspom" "")
);if

(if	(= (tblsearch "block" name_block) nil) ;ищем блок с именем
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    
    (command "_line" '(-0.5 0) '(0.5 0) "")
    (setq line_1 (entlast))
    
    (command "_line" '(-0.5 0) '(-0.5 -1) "")
    (setq line_3 (entlast))
    
    (command "_line" '(0.5 0) '(0.5 -1) "")
    (setq line_4 (entlast))
    
    (command "_line" '(-0.5 -1) '(0.5 -1) "")
    (setq line_7 (entlast))
    
    ;линии 0.6 мм
    (setvar "CELWEIGHT" 120)    
       
    (command "_line" '(0 -1) '(0 -2) "")
    (setq line_6 (entlast))   
    
    (setvar "CELWEIGHT" -1)
    (setvar	"CLAYER" "wspom")
    (command "_TEXT" "_BC" '(0 -0.5) 0.2 0 "нсв") ;текст
    (setq txt_1 (entlast))
    (setvar	"CLAYER" "0")
    
    (command "_block" name_block '(0 0) line_1 line_3 line_4 line_6 line_7 txt_1 ""
		);command
  );progn
);if

(setvar "osmode" 6199)

(setq pnt-ins (getpoint "\n”кажите точку вставки\n")
			pnt-drct (getpoint "\n”кажите направление знака\n")
			angl (atoi (angtos (angle pnt-ins pnt-drct))) ; угол вставки
);setq

(setvar "osmode" 0)

(if (and (<= angl 135) (>= angl 45));знак вверх
	(setq angl_blck 180);setq
);if
		
(if (and (<= angl 225) (>= angl 135));знак влево
	(setq angl_blck 270);setq
);if

(if (or (<= angl 45) (>= angl 315));знак вправо
	(setq angl_blck 90);setq
);if

(if (and (>= angl 225) (<= angl 315));знак вниз
	(setq angl_blck 0);setq
);if

(command "_insert" name_block "_x" 1 "_y" 1 "_z" 1 "_r" angl_blck pnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)
(princ)
)
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
