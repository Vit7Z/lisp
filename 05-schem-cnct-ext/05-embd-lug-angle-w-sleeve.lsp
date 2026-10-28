;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
(defun c:05-embd-lug-angle-w-sleeve

( / line_1 line_10 line_2 line_3 line_4 line_5 line_6 line_7 line_8 line_9 name_block pnt-ins)

(setq name_block "бобышка-”гл-c-гильзой-ссвп");setq
(setvar "cmdecho" 0)

(if	(= (tblsearch "block" name_block) nil) ;ищем блок с именем
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    (setvar "CELWEIGHT" -1)
    
    ;горизонтальные линии
    (command "_line" '(-0.5 8.5) '(0.5 8.5) "")
    (setq line_1 (entlast))
    
    (command "_line" '(-1.5 1) '(1.5 1) "")
    (setq line_2 (entlast))
    
    (command "_line" '(-1.5 0) '(1.5 0) "")
    (setq line_3 (entlast))
    
    ;наклонна€ лини€
    (command "_line" '(-1.5 7.5) '(1.5 4.5) "")
    (setq line_4 (entlast))
    
    ;вертикальные линии гильза
    (command "_line" '(-0.5 8.5) '(-0.5 6.5) "")
    (setq line_5 (entlast))
    
    (command "_line" '(0.5 8.5) '(0.5 5.5) "")
    (setq line_6 (entlast))
    
    (command "_line" '(-1.5 7.5) '(-1.5 0) "")
    (setq line_7 (entlast))
    
    (command "_line" '(1.5 4.5) '(1.5 0) "")
    (setq line_8 (entlast))
    
    (command "_line" '(-0.75 1) '(-0.75 0) "")
    (setq line_9 (entlast))
    
    (command "_line" '(0.75 1) '(0.75 0) "")
    (setq line_10 (entlast))
    
    (command "_block" name_block '(0 0) line_1 line_2 line_3 line_4 line_5 line_6 line_7 
                                         line_8 line_9 line_10 ""
		);command
  );progn
);if

(setvar "osmode" 6199)
(setq pnt-ins (getpoint "\n”кажите точку вставки\n"));setq

(setvar "osmode" 0)
(command "_insert" name_block "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)
(princ)
)
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
