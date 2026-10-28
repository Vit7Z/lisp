;/////// ************************************************************ //////////////////////////////////////////////////////////////////
;/////// подпрограмма модификации номера                              //////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////
(defun edit-number-page

(arg-01 arg-02 arg-03 arg-04 / crnt-obj dlt-x-1 dlt-x-2 dlt-x-3 dlt-y-1 dlt-y-2 dlt-y-3 p1 p2 swtch txt-h)

(setvar "cmdecho" 0)

;параметры штампа 15мм
(if (= arg-01 "штамп-15мм-спдс-1") (setq swtch 101));if
(if (= arg-01 "штамп-15мм-спдс-спцф-1") (setq swtch 101));if
(if (= arg-01 "овш-штамп-15мм-спдс") (setq swtch 101));if

(if (= swtch 101)
  (setq dlt-x-1 -2
        dlt-x-2 -8
        dlt-y-1 5
        dlt-y-2 3
        ;для создания текста
        dlt-x-3 -5
        dlt-y-3 4
        txt-h 3.5
  );setq
);if

;параметры штампа 55мм
(if (= arg-01 "штамп-55мм-спдс-1")
  (setq swtch 103);setq
);if

(if (= arg-01 "штамп-55мм-спдс-спцф-1")
  (setq swtch 103);setq
);if

(if (= swtch 103)
  (setq dlt-x-1 -21
        dlt-x-2 -33
        dlt-y-1 23
        dlt-y-2 20
        ;для создания текста
        dlt-x-3 -27.5
        dlt-y-3 20
        txt-h 3.5
  );setq
);if


(progn
  (setq p1 (list (+ arg-02 dlt-x-1) (+ arg-03 dlt-y-1));точки секущей линии
			  p2 (list (+ arg-02 dlt-x-2) (+ arg-03 dlt-y-2))
  );setq
  (setq	crnt-obj (ssget "_C" p1 p2 '((0 . "*text"))));setq
					
  (if (/= crnt-obj nil)
    (command "_erase" crnt-obj "")
  );if
  (command "_text" "_MC" (list (+ arg-02 dlt-x-3) (+ arg-03 dlt-y-3)) txt-h 0 arg-04)
);progn

(setvar "cmdecho" 0)
)
;/////// конец программы ///////