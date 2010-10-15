class AddSpecialForms < ActiveRecord::Migration

  def self.add_special_form(lib, ns, name, doc)

    return if not lib or not ns
    
    f = Function.new
    f.name = name
    f.doc = doc
    f.shortdoc = doc
    f.version = lib.version
    f.arglists_comp = ""
    f.namespace_id = ns.id
    f.url_friendly_name = name
    if name == "."
      f.url_friendly_name = "_dot"
    end

    f.save
  end
  
  def self.up

    lib = Library.find_by_name_and_version('Clojure Core', '1.2.0')
    ns = Namespace.find_by_name_and_version('clojure.core', '1.2.0')

    add_special_form(lib,
                     ns,
                     'def',
                     'Please see http://clojure.org/special_forms#def')

    add_special_form(lib,
                     ns,
                     'if',
                     'Please see http://clojure.org/special_forms#if')

    add_special_form(lib,
                     ns,
                     'do',
                     'Please see http://clojure.org/special_forms#do')

    add_special_form(lib,
                     ns,
                     'quote',
                     'Please see http://clojure.org/special_forms#quote')

    add_special_form(lib,
                     ns,
                     'var',
                     'Please see http://clojure.org/special_forms#var')

    add_special_form(lib,
                     ns,
                     'recur',
                     'Please see http://clojure.org/special_forms#recur')

    add_special_form(lib,
                     ns,
                     'throw',
                     'Please see http://clojure.org/special_forms#throw')

    add_special_form(lib,
                     ns,
                     'try',
                     'Please see http://clojure.org/special_forms#try')

    add_special_form(lib,
                     ns,
                     'monitor-exit',
                     'Please see http://clojure.org/special_forms#monitor-exit')

    add_special_form(lib,
                     ns,
                     'monitor-enter',
                     'Please see http://clojure.org/special_forms#monitor-enter')

    add_special_form(lib,
                     ns,
                     '.',
                     'Please see http://clojure.org/java_interop#dot')

    add_special_form(lib,
                     ns,
                     'new',
                     'Please see http://clojure.org/java_interop#new')

    add_special_form(lib,
                     ns,
                     'set!',
                     'Please see http://clojure.org/special_forms#set')
  end

  def self.down
  end
end
