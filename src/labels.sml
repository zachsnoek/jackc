structure LabelGenerator =
struct
    val ifElseLabel = ref 0;
    val whileLabel = ref 0;

    fun nextIfElse() =
        let val lab = !ifElseLabel
        in 
            ifElseLabel := !ifElseLabel + 1;
            Int.toString(lab)
        end

    fun nextWhile() =
        let val lab = !whileLabel
        in 
            whileLabel := !whileLabel + 1;
            Int.toString(lab)
        end

    (* Reset labels between subroutine compilation. *)
    fun resetLabels() = (
        ifElseLabel := 0;
        whileLabel := 0
    )
end