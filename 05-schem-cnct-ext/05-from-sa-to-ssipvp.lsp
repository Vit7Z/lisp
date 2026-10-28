;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// перенос позиционных обозначений с листа ФСА в таблицу ССВП    //////////////////////////////////////////////////////////////////////////////////////////////////////////
;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:05-from-sa-to-ssipvp

( / adoc bot-txt p11-c p12-c p21-c p22-c prmtv-del slct-bot-txt slct-crcl slct-top-txt slct-txt top-txt txt-1 x-dlt x-pnt-1 x-pnt-2 y-dlt y-pnt-1 y-pnt-2)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));undo

(setvar	"osmode" 0)

(setq	slct-crcl (car (entsel "\nВыберите прибор\n"))

			x-pnt-1 (nth 1 (assoc 10 (entget slct-crcl)));точка вставки круга
			y-pnt-1 (nth 2 (assoc 10 (entget slct-crcl)))
	
  		p11-c (list (+ x-pnt-1 4) (+ y-pnt-1 1));cекущая рамка, верхний текст
  		p12-c (list (- x-pnt-1 4) (+ y-pnt-1 2))
      p21-c (list (+ x-pnt-1 4) (- y-pnt-1 2));cекущая рамка, нижний текст
  		p22-c (list (- x-pnt-1 4) (- y-pnt-1 1))
  		
  		slct-top-txt (ssget "_C" p11-c p12-c '((0 . "TEXT")));верхний текст
      slct-bot-txt (ssget "_C" p21-c p22-c '((0 . "TEXT")));нижний текст
  		
  		top-txt (cdr (assoc 1 (entget (ssname slct-top-txt 0))));извлекаем данные из текстов
	    bot-txt (cdr (assoc 1 (entget (ssname slct-bot-txt 0))))
	    slct-txt (strcat top-txt bot-txt)
);setq

(setvar "osmode" 6199) 

(setq	p11-c (getpoint "\nУкажите Лев-Верх точку\n")
			x-pnt-1 (nth 0 p11-c)
			y-pnt-1 (nth 1 p11-c)
			
			p12-c (getpoint "\nУкажите Прав-Нижн точку\n")
			x-pnt-2	(nth 0 p12-c)
			y-pnt-2	(nth 1 p12-c)
			
			x-dlt (* (- x-pnt-2 x-pnt-1) 0.5)
			
			y-dlt (* (- y-pnt-1 y-pnt-2) 0.5)
			
			p21-c (list (+ x-pnt-1 x-dlt) (- y-pnt-1 y-dlt));точка вставки поиционного обозначения в таблице
);setq

;удаляем примитивы в графе поз
(setvar "osmode" 0)

(setq	prmtv-del (ssget "_w" p11-c p12-c '((0 . "*TEXT"))));setq

(if (/= prmtv-del nil) (command "_erase" prmtv-del ""));if

(setq txt-1 
	(entmakex
		(list
			'(0 . "TEXT")
			'(100 . "AcDbEntity")
			'(100 . "AcDbText")
			(cons 10 p21-c) ; нач точка текста
			(cons 11 p21-c) ; нач точка текста
			(cons 1 slct-txt) ; содержание текста
			'(40 . 2.5) ; высота текста
			'(41 . 1.0) ; растяжение текста
			'(50 . 0) ; поворот текста
			'(72 . 1) ; гориз выравнивание текста
			'(73 . 2) ; верт выравнивание текста
			'(370 . -1) ; толщина текста
			 (cons 7 "Standard") ; стиль текста
		);list
	);entmakex
);setq

(vla-endundomark adoc)

(setvar "CMDECHO" 1)

(setvar	"ORTHOMODE" 1)

(setvar	"osmode" 6199)

(princ)
)
;///////////////////////////////////// конец программы    //////////////////////////

