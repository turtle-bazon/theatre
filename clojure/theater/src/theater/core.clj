(ns theater.core)

(def seats-count 1000)

(defn seat []
  (loop [seats (vec (repeat seats-count nil))
         left (apply list (range seats-count))
         current 0]
    (if (pos? (count left))
      (let [position (if (or (nth seats current) (= 0 current))
                       (rand-nth left)
                       current)]
        (recur (assoc seats position current)
               (remove #(= position %) left)
               (inc current)))
      seats)))

(defn test-theater []
  (= (dec seats-count)
     (last (seat))))

(def iterations-count 100)

(/ (count (filter true?  (for [i (range iterations-count)]
                           (test-theater))))
   iterations-count)
