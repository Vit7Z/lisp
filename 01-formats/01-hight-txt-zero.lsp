
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// приведение высоты текста стиля "Standard" к 0                //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun hight-txt-zero

  ( / data-style old-hight-txt txt-style) 
  
  (setvar "cmdecho" 0)
  
	(setq txt-style (tblobjname "style" "Standard");извлекаем данные стиля standard
				data-style (entget txt-style)
	);setq
	
	(entmod ;делаем высоту текста равной 0
		(subst (cons 40 0.0)
					 (setq old-hight-txt (assoc 40 data-style));setq
					 data-style
		);subst
	);entmod
	
	(setvar "cmdecho" 1)
	
	);end of defun 
(hight-txt-zero)
(princ)
;/////// конец ///////

