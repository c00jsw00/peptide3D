while read -r  a1 a2 a3 a4 a5 a6 a7 a8 a9 a10; do
    if [ -n "$a1" ]; then 
	echo "bond aa.$a1.SG  aa.$a2.SG"
    fi    
    #
    if [ -n "$a3" ]; then
        echo "bond aa.$a3.SG  aa.$a4.SG"
    fi
    #
    if [ -n "$a5" ]; then
        echo "bond aa.$a5.SG  aa.$a6.SG"
    fi
    #
    if [ -n "$7" ]; then
        echo "bond aa.$a7.SG  aa.$a8.SG"
    fi
    #
    if [ -n "$9" ]; then
        echo "bond aa.$a9.SG  aa.$a10.SG"
    fi
done < ssbond3
