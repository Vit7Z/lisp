
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////

(defun c:101-00-spcf-numbering

( / adoc counter crnt-num crnt-num-new crnt-num-old crnt-pg list-num p1 p11 p2 p21 pg-1 pnt-ins1 pnt-pg1 txt xpnt-ins1 ypnt-ins1)

(setvar "cmdecho" 0)
(setvar "osmode" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

;первый лист
(setq pg-1 (car (entsel "\nВыберите первый лист\n"))
      pnt-ins1 (cdr (assoc 10 (entget pg-1)))
      pnt-pg1 pnt-ins1;точка вставки первой страницы
      xpnt-ins1 (nth 0 pnt-ins1)
      ypnt-ins1 (nth 1 pnt-ins1)
      counter 1
);setq

(command "_.zoom" "_all")

(setq p1 (list (+ xpnt-ins1 510) (+ ypnt-ins1 10));точки секущей линии
			p2 (list (+ xpnt-ins1 490) (- ypnt-ins1 10))
			
			crnt-pg (ssget "_C" p1 p2 '((0 . "insert")));ssget
      crnt-pg (cdr (assoc 0 (entget (ssname crnt-pg 0))))
);setq


(while (= crnt-pg "INSERT")
	(setq xpnt-ins1 (+ xpnt-ins1 510);точки секущей линии, выбор рамки спецификации
	      p1 (list xpnt-ins1 (+ ypnt-ins1 10))
				p2 (list (- xpnt-ins1 20) (- ypnt-ins1 10))
				crnt-pg (ssget "_C" p1 p2 '((0 . "insert")));выбираем лист спецификации
	);setq

  (if (/= crnt-pg nil) (setq	crnt-pg (cdr (assoc 0 (entget (ssname crnt-pg 0))))));if
	
	(setq p11 (list (+ xpnt-ins1 403) (+ ypnt-ins1 10));точки секущей линии, выбор штампа спецификации
	      p21 (list (+ xpnt-ins1 397) (+ ypnt-ins1 8))
	      crnt-num (ssget "_C" p11 p21 '((0 . "TEXT")));выбираем номер листа
	);setq
	  
  (if (/= crnt-num nil)
    (progn
			(setq	list-num (entget (ssname crnt-num 0))
						crnt-num-old (assoc 1 list-num);операции с номером
						counter (+ counter 1)
						crnt-num-new (cons 1 (itoa counter))
						
						height-old (assoc 40 list-num);операции с высотой
						height-new (cons 40 3.5)
			);setq
			(setq	list-num (subst crnt-num-new crnt-num-old list-num)
						list-num (subst height-new height-old list-num)
			);setq
			(entmod list-num)
		);progn
	);if
  		
	(setq xpnt-ins1 (- xpnt-ins1 50);точки секущей линии
	);setq
);while

;редактируем количество страниц на первой странице
(setq xpnt-ins1 nil
      ypnt-ins1 nil
      crnt-pg nil
      xpnt-ins1 (nth 0 pnt-pg1)
      ypnt-ins1 (nth 1 pnt-pg1)
);setq

(setq p1 (list (+ xpnt-ins1 449) (+ ypnt-ins1 26));точки секущей линии
			p2 (list (+ xpnt-ins1 441) (+ ypnt-ins1 24))
			crnt-pg (ssget "_C" p1 p2 '((0 . "TEXT")))
);setq
	
(if (/= crnt-pg nil);если текст есть
  (progn 
    (setq	crnt-pg (cdr (car (entget (ssname crnt-pg 0)))));setq
    (command "_erase" crnt-pg "")
	);progn
);if

(setq p1 (list (+ xpnt-ins1 445) (+ ypnt-ins1 25)));setq
 
(setq txt
  (entmakex
    (list
				'(0 . "TEXT")
				'(100 . "AcDbEntity")
				'(100 . "AcDbText")
				(cons 10 p1) ; нач точка текста
				(cons 11 p1) ; нач точка текста
				(cons 1 (itoa counter)) ; содержание текста
				'(40 . 3.5) ; высота текста
				'(41 . 1) ; растяжение текста
				'(50 . 0) ; поворот текста
				'(72 . 1) ; гориз выравнивание текста
				'(73 . 2) ; верт выравнивание текста
				'(370 . -1) ; толщина текста
				(cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

;(command "_zoom" "_all")

(vla-endundomark adoc)	
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(princ)
)
;///////                                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
