;/////// ************************************************************ ////////////////////////////////////////
;///////                                                              ////////////////////////////////////////
(defun c:05-embd-protective-sleeve

( / line_1 line_2 line_3 line_4 line_5 line_6 line_7 line_8 line_9 name_block pnt-ins)

(setq name_block "гильза-защитная-ссвп");setq
(setvar "cmdecho" 0)

(if	(= (tblsearch "block" name_block) nil) ;ищем блок с именем
  (progn
    (setvar "osmode" 0)
    (setvar	"CLAYER" "0")
    (setvar "CELWEIGHT" -1)
    
    ;горизонтальные линии гильза
    (command "_line" '(-0.5 8.5) '(0.5 8.5) "")
    (setq line_1 (entlast))
    
    (command "_line" '(-1.5 1) '(1.5 1) "")
    (setq line_2 (entlast))
    
    (command "_line" '(-1.5 0) '(1.5 0) "")
    (setq line_3 (entlast))
    
    ;вертикальные линии гильза
    (command "_line" '(-0.5 8.5) '(-0.5 1) "")
    (setq line_4 (entlast))
    
    (command "_line" '(0.5 8.5) '(0.5 1) "")
    (setq line_5 (entlast))
    
    (command "_line" '(-1.5 1) '(-1.5 0) "")
    (setq line_6 (entlast))
    
    (command "_line" '(-0.75 1) '(-0.75 0) "")
    (setq line_7 (entlast))
    
    (command "_line" '(0.75 1) '(0.75 0) "")
    (setq line_8 (entlast))
    
    (command "_line" '(1.5 1) '(1.5 0) "")
    (setq line_9 (entlast))
    
    (command "_block" name_block '(0 0) line_1 line_2 line_3 line_4 line_5 line_6 line_7 
                                         line_8 line_9 ""
		);command
  );progn
);if

(setvar "osmode" 6199)
(setq pnt-ins (getpoint "\nУкажите точку вставки\n"));setq

(setvar "osmode" 0)
(command "_insert" name_block "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)

(setvar "osmode" 6199)
(setvar "cmdecho" 0)
(princ)
)
;///////                                                              ////////////////////////////////////////
;/////// ************************************************************ ////////////////////////////////////////
