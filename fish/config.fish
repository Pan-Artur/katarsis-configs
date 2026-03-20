if status is-interactive
    set -g fish_greeting

    set -x JAVA_HOME /usr/lib/jvm/java-21-openjdk
    set -x PATH $JAVA_HOME/bin $PATH
end
