;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// перенос данных из пэ в спецификацию                          //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:101-00-from-le-to-spcf

( / adoc dlt-y nmbr p-ins pnt-1 pnt-2 pnt-bttm pnt-cp-nmbr pnt-cp-pos pnt-ins-nmbr pnt-top pos pos-del pos-old xp-ins xpnt-bttm xpnt-top yp-ins ypnt-bttm ypnt-top)

(vl-load-com)

(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setvar "osmode" 6199)

(setvar "cmdecho" 0)

(while (/= nil (setq pnt-top (getpoint "\nВыберите точку верх\n")))

	(setq	pnt-bttm (getpoint "\nВыберите точку низ\n"));setq

	(setq xpnt-top (nth 0 pnt-top)
				ypnt-top (nth 1 pnt-top)
				
				xpnt-bttm (nth 0 pnt-bttm)
				ypnt-bttm (nth 1 pnt-bttm)
				
				pnt-cp-pos pnt-top;точка копирования позиций
				
				dlt-y (- ypnt-top ypnt-bttm);setq
	);setq

	;;/////////////////////////////
	;;собираем данные в графе "поз"
	;;/////////////////////////////
	
	(setvar "osmode" 0)
	
	(setq	pos (ssget "_w" pnt-top pnt-bttm '((0 . "*TEXT"))));набор позиций

	;;/////////////////////////////
	;;собираем данные в графе "кол"
	;;/////////////////////////////
	
	(setq pnt-1 (list (+ xpnt-top 110) ypnt-top) ;точки рамки
				pnt-2 (list (+ xpnt-top 120) (- ypnt-top 8))
				
				pnt-cp-nmbr (list (+ xpnt-top 115) (- ypnt-top 8))
	);setq
	
	(setq	nmbr (ssget "_w" pnt-1 pnt-2 '((0 . "*TEXT"))));примитив количества
	
	(setvar "osmode" 6199)
	
	;точка вставки строк спецификаций
	(setq p-ins (getpoint "\nУкажите точку вставки\n")
				xp-ins (nth 0 p-ins)
				yp-ins (nth 1 p-ins)
	);setq

	(setvar "osmode" 0)
	
	;;стираем  данные в графе "поз"
	(setq pnt-top (list (- xp-ins 20) yp-ins) ;точки секущей линии
				pnt-bttm (list xp-ins (- yp-ins (+ dlt-y 8)))
	);setq
	
	(setq	pos-del (ssget "_w" pnt-top pnt-bttm '((0 . "*TEXT"))));setq
	
	(if (/= pos-del nil) (command "_erase" pos-del ""));if
	
	;копирование позиционных обозначений
	(if (/= pos nil) (command "_copy" pos "" pnt-cp-pos p-ins))	
	
	;;стираем  данные в графе "кол"
	(setq pnt-top (list (+ xp-ins 290) yp-ins) ;точки секущей линии
				pnt-bttm (list (+ xp-ins 310) (- yp-ins 8))
	);setq
	
	(setq	pos-old (ssget "_w" pnt-top pnt-bttm '((0 . "*TEXT"))));setq
	
	(command "_.erase" pos-old "")
	
	;точка вставки количества
	(setq pnt-ins-nmbr (list (+ xp-ins 300) (- yp-ins 8)));setq
		
	;копирование количества
	(command "_copy" nmbr "" pnt-cp-nmbr pnt-ins-nmbr)
	
	(setvar "osmode" 6199)
	
);while

(setvar "osmode" 6199)

(setvar "cmdecho" 1)

(vla-endundomark adoc)
(princ)
)
;/////// конец программы ///////