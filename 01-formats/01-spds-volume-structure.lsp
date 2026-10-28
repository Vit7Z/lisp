;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// обложка и тит лист пояснительной записки                     //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun c:01-cover-page-explanatory-note

( / adoc pnt-1 rctn-1 rctn-2 rctn-3 txt-1 txt-2 txt-3 txt-4 xpnt-1 ypnt-1)

(setvar	"cmdecho" 0)
(setvar	"textstyle" "Standard")

(vl-load-com)
(vla-startundomark
  (setq adoc (vla-get-activedocument (vlax-get-acad-object)))
) ; start undo

; создаем слой wspom
(if (= (tblsearch "layer" "wspom") nil)
			(command "_layer" "_Make" "wspom" "_Color" 3 "wspom" "_L" "Continuous" "wspom"   "")
); end if

(if (= (tblsearch "block" "а4-верт-обложка-спдс" ) nil)
	(progn				; если данного блока нет
    (setvar	"CLAYER" "wspom")
    (setvar	"OSMODE" 0)
    ; вспом квадрат в левом нижнем углу
		(command "_RECTANGLE" '(0 0) '(40 -40)) 
		(setq rctn-1 (entlast))
    
    ;внешняя рамка формата
    (setq rctn-2
      (entmakex
        (list
          '(0 . "LWPOLYLINE")
          '(100 . "AcDbEntity")
          '(100 . "AcDbPolyline")
          '(70 . 1) ; замкнутость
          '(90 . 4) ; числ сторон
          '(43 . 0.0)
          '(8 . "wspom") ; слой
          '(10  40. 0.) ; точки вершин
          '(10  40. 297.)
          '(10  250. 297.)
          '(10  250. 0.)
          '(10  40. 0.)
         ;'(370 . 0) ; толщина линии
        ) ; end of list
      ); entmakex
    ); setq
    
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60)
		(command "_RECTANGLE" '(60 292) '(245 5))
		(setq rctn-3 (entlast))
		(setvar "CELWEIGHT" -1)
			
		(command "_block" "а4-верт-обложка-спдс" '(0 0)  rctn-1  rctn-2  rctn-3 ""
		);command
		
	); end progn
); end if

(setvar	"OSMODE" 6199)

(setq pnt-1 (getpoint "\nУкажите точку вставки\n")
      xpnt-1 (nth 0 pnt-1)
      ypnt-1 (nth 1 pnt-1)
);setq

(setvar	"OSMODE" 0)

(command "_insert" "а4-верт-обложка-спдс" "_X" 1 "_Y" 1 "_Z" 1 "_R" 0 pnt-1) ; если блок существует

(command "_text" "_MC" (list (+ xpnt-1 152.5) (+ ypnt-1 270)) 7 0 "ООО \"Р.В.С.\"")

(setq txt-1
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 (list (+ xpnt-1 152.5) (+ ypnt-1 240))) ; нач точка текста
      '(1 . "Филиал ОАО \"ТГК-5\" \"Кировский\"\\PКировская ТЭЦ-1**") ; содержание текста
      '(40 . 5) ; высота текста
      '(41 . 155) ; растяжение текста
      '(42 . 155) ; ширина текста
      '(44 . 1.5)
      '(71 . 5) ; гориз выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(setq txt-2
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 (list (+ xpnt-1 152.5) (+ ypnt-1 200))) ; нач точка текста
      '(1 . "МОДЕРНИЗАЦИЯ УЗЛОВ УЧЕТА ТЕПЛОВОЙ ЭНЕРГИИ\\PНА ОБЪЕКТАХ КЭС-ХОЛДИНГА") ; содержание текста
      '(40 . 3.5) ; высота текста
      '(41 . 155) ; растяжение текста
      '(42 . 155) ; ширина текста
      '(71 . 5) ; гориз выравнивание текста
      '(44 . 1.5)
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(command "_text" "_MC" (list (+ xpnt-1 152.5) (+ ypnt-1 170)) 5 0 "Рабочая документация")

(setq txt-3
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 (list (+ xpnt-1 152.5) (+ ypnt-1 150))) ; нач точка текста
      '(1 . "Тепломеханические решения") ; содержание текста
      '(40 . 5) ; высота текста
      '(41 . 155) ; растяжение текста
      '(42 . 155) ; ширина текста
      '(71 . 5) ; гориз выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex
); setq

(setq txt-4
  (entmakex
    (list
      '(0 . "MTEXT")
      '(100 . "AcDbEntity")
      '(100 . "AcDbMText")
       (cons 10 (list (+ xpnt-1 152.5) (+ ypnt-1 130))) ; нач точка текста
      '(1 . "Пояснительная записка") ; содержание текста
      '(40 . 5) ; высота текста
      '(41 . 155) ; растяжение текста
      '(42 . 155) ; ширина текста
      '(71 . 5) ; гориз выравнивание текста
      '(370 . -1) ; толщина текста
       (cons 7 (getvar "textstyle")) ; стиль текста
    ) ; end of list
  ); entmakex 
); setq

(command "_text" "_MC" (list (+ xpnt-1 152.5) (+ ypnt-1 117)) 5 0 "72122884.0121127.001.**.**-**")
(command "_text" "_MC" (list (+ xpnt-1 152.5) (+ ypnt-1 105)) 5 0 "Том **")
(command "_text" "_MC" (list (+ xpnt-1 152.5) (+ ypnt-1 17)) 5 0 "2016")

(vla-endundomark adoc)

(setvar "osmode" 6199)
(setvar	"cmdecho" 1)
(setvar "orthomode" 1)
(princ)
)
;/////// конец программы /////////////////////////////////////////////////////////////////
