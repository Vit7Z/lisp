;;; разработчик seaotter56@mail.ru
;/////// *************************************************************//////////////////////////////////////////////////
;/////// перенос подключения от коробки на СПВП                       //////////////////////////////////////////////////
;/////// *************************************************************//////////////////////////////////////////////////
(defun c:07-wires-from-junc-box-to-terminal

( / adoc cntr-1 crnt-obj dlt-y lin1-p1 lin1-p2 list-901 lngth-set name-block num-1 num-2 pnt-ins set-cabel 
set-wirings tmp-list txt txt-cbl txt-crnt txt-p1 typ-obj xpnt-blck ypnt-blck)

(vl-load-com)
(vla-startundomark 
	(setq adoc (vla-get-activedocument (vlax-get-acad-object)))
);start undo

(setvar "cmdecho" 0)

(setq cntr-1 0
      list-901 nil
			crnt-obj nil
			set-wirings (ssget '((0 . "*text")))
			lngth-set (sslength set-wirings)
);setq

(setq set-cabel (ssget));setq

;;;;;;; создаем набор из текстов и координат
(repeat lngth-set
  (setq crnt-obj (entget (ssname set-wirings cntr-1)) 
				tmp-list (list (assoc 1 crnt-obj) (assoc 11 crnt-obj))				
				list-901 (vl-list* tmp-list list-901)
				cntr-1 (1+ cntr-1)
	);setq
);repeat

;;;;;;;сортируем набор по "x"
(setq list-901 (vl-sort list-901 
  (function 
	  (lambda (num-1 num-2) 
		  (< (nth 1 (assoc 11 num-1)) (nth 1 (assoc 11 num-2))));lambda
		));vl-sort
);setq

(setq cntr-1 0);setq

(repeat (length list-901)
  (setvar "osmode" 6199)
  (setq txt-crnt (cdr (car (nth cntr-1 list-901)))
        txt (strcat "\nУкажите точку вставки для " txt-crnt "\n")
        pnt-ins (getpoint txt)		  
			  lin1-p1 (list (nth 0 pnt-ins) (- (nth 1 pnt-ins) 12))
			  lin1-p2 (list (nth 0 pnt-ins) (nth 1 pnt-ins))				
			  txt-p1 (list (nth 0 pnt-ins) (- (nth 1 pnt-ins) 11))						
  );setq
  
  (setvar "osmode" 0)
  (if (/= txt-crnt nil)
		(command "_text" "_bl" txt-p1 2.5 90 txt-crnt)
	);if
	
	(command "_.line" lin1-p1 lin1-p2 "")
	
	(if (= cntr-1 0)
    (setq xpnt-blck (nth 0 pnt-ins)
          ypnt-blck (nth 1 pnt-ins)
    );setq
	);if
	
	(setq cntr-1 (1+ cntr-1));setq
);repeat

;;;;;;; вставка обозначение кабеля
(setq cntr-1 0);setq

(repeat (sslength set-cabel)
  (setq crnt-obj (entget (ssname set-cabel cntr-1))
			  typ-obj (cdr (assoc 0 crnt-obj))
	);setq
	
	(if (= typ-obj "INSERT");имя блока
	  (setq name-block (cdr (assoc 2 crnt-obj)));setq
	);if
	
	(if (= typ-obj "TEXT");имя блока
	  (setq txt-cbl (cdr (assoc 1 crnt-obj)));setq
	);if

  (setq cntr-1 (1+ cntr-1));setq
);repeat

(cond
	((= name-block "ссвп-обозн-каб-12мм") (setq dlt-y -9));=
	((= name-block "ссвп-обозн-каб-15мм") (setq dlt-y -10.5));=
	((= name-block "ссвп-обозн-каб-20мм") (setq dlt-y -13));=
	((= name-block "ссвп-обозн-каб-30мм") (setq dlt-y -18));=
);cond

;;;;;;; вставка блока знака кабеля
(setq xpnt-blck (+ xpnt-blck 5)			
      ypnt-blck (- ypnt-blck 12)
			pnt-ins (list xpnt-blck ypnt-blck)		
			
			ypnt-blck (+ ypnt-blck dlt-y)
			txt-p1 (list xpnt-blck ypnt-blck)		
);setq

(setvar "osmode" 0)
(command "_insert" name-block "_x" 1 "_y" 1 "_z" 1 "_r" 0 pnt-ins)
(command "_text" "_mc" txt-p1 2.5 90 txt-cbl)

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(princ)
(gc)
)

;///////*************************************************************/////////////////////////////////////////
;//////////////////////////// конец //////////////////////////////////////////////////////////////////////////

