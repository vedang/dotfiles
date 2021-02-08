#!/usr/bin/env bb

(ns leintodeps
  (:require [clojure.java.io :as jio]
            [clojure.pprint :as pp]))

(defn project-clj-map [filename]
  (->> (slurp filename)
       (read-string)
       (drop 1)
       (partition 2)
       (map vec)
       (into {})))

(defn lein-deps [filename]
  (let [project-clj (project-clj-map filename)]
    (get project-clj :dependencies)))

(defn edn-dep [lein-dep]
  (let [[id version] lein-dep]
    {id {:mvn/version version}}))

(defn edn-deps [lein-deps]
  (let [deps (into {} (map edn-dep lein-deps))]
    {:deps deps}))

(defn pprint-write [out-file m]
  (with-open [w (jio/writer out-file)]
    (binding [*out* w]
      (pp/pprint m))))

(defn spit-edn-deps []
  (->> (lein-deps "project.clj")
       (edn-deps)
       (pprint-write "deps.edn")))

;;; Make the call
(spit-edn-deps)
