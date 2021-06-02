/**
 * Curso: Elementos de Sistemas
 * Arquivo: Code.java
 */

package assembler;

import java.util.ArrayList;
import java.util.List;

/**
 * Traduz mnemônicos da linguagem assembly para códigos binários da arquitetura Z0.
 */
public class Code {

    /**
     * Retorna o código binário do(s) registrador(es) que vão receber o valor da instrução.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 4 bits) com código em linguagem de máquina para a instrução.
     */
    public static String dest(String[] mnemnonic) {
        String A = "0001";
        String D = "0010";
        String M = "0100";
        String JMP = "0000";
        String destino = "";
        int size = mnemnonic.length;

        if (size == 1) {
            destino = "0000";
        }

        else if (size == 2) {
            switch (mnemnonic[1]) {
                case "%A":
                    destino = A;
                    break;
                case "%D":
                    destino = D;
                    break;
                case "(%A)":
                    destino = M;
            }
        }

        else if (size == 3) {
            switch (mnemnonic[2]) {
                case "%A":
                    destino = A;
                    break;
                case "%D":
                    destino = D;
                    break;
                case "(%A)":
                    destino = M;
            }
        }

        else if (size == 4) {
            String destino_um = "";
            String destino_dois = "";
            if (mnemnonic[0] == "movw") {
                switch (mnemnonic[2]) {
                    case "%A":
                        destino_um = A;
                        break;
                    case "%D":
                        destino_um = D;
                        break;
                    case "(%A)":
                        destino_um = M;
                }
                switch (mnemnonic[3]) {
                    case "%A":
                        destino_dois = A;
                        break;
                    case "%D":
                        destino_dois = D;
                        break;
                    case "(%A)":
                        destino_dois = M;
                }
                if (destino_um == A & destino_dois == D) {
                    destino = "0011";
                } else if (destino_um == A & destino_dois == M) {
                    destino = "0101";
                } else if (destino_um == D & destino_dois == M) {
                    destino = "0110";
                }
            }    
            else {
                switch (mnemnonic[3]) {
                    case "%D":
                        destino = D;
                        break;
                    case "%A":
                        destino = A;
                        break;
                    case "(%A)":
                        destino = M;
                }
            }
        }

        else if (size == 5) {
            destino = "0111";
        }

        return destino;
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public static String comp(String[] mnemnonic) {
        String operacao = "000000000";

            switch (mnemnonic[0]) {

                case "jmp":
                    operacao = "000001100";
                    break;
                case "je":
                    operacao = "000001100";
                    break;
                case "jne":
                    operacao = "000001100";
                    break;
                case "jg":
                    operacao = "000001100";
                    break;
                case "jge":
                    operacao = "000001100";
                    break;
                case "jl":
                    operacao = "000001100";
                    break;
                case "jle":
                    operacao = "000001100";
                    break;

                case "movw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            operacao = "000110000";
                            break;
                        case "%D":
                            operacao = "000001100";
                            break;
                        case "(%A)":
                            operacao = "001110000";
                            break;
                        case "$1":
                            operacao = "000111111";
                            break;
                        case "$0":
                            operacao = "000101010";
                    }
                    break;
                case "addw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            switch (mnemnonic[2]) {
                                case "%D":
                                    operacao = "000000010";
                                    break;
                                case "$1":
                                    operacao = "000110111";
                            }
                            break;
                        case "%D":
                            switch (mnemnonic[2]) {
                                case "(%A)":
                                    operacao = "001000010";
                                    break;
                                case "$1":
                                    operacao = "000011111";
                                    break;
                                case "%A":
                                    operacao = "000000010";
                            }
                            break;
                        case "(%A)":
                            switch (mnemnonic[2]) {
                                case "$1":
                                    operacao = "001110111";
                                    break;
                                case "%D":
                                    operacao = "001000010";
                            }
                            break;
                        case "$1":
                            switch (mnemnonic[2]) {
                                case "(%A)":
                                    operacao = "001110111";
                                    break;
                                case "%D":
                                    operacao = "000011111";
                                    break;
                                case "%A":
                                    operacao = "000110111";
                            }
                    }
                    break;
                case "subw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            switch (mnemnonic[2]) {
                                case "%D":
                                    operacao = "000000111";
                                    break;
                                case "$1":
                                    operacao = "000110010";
                            }
                            break;
                        case "%D":
                            switch (mnemnonic[2]) {
                                case "(%A)":
                                    operacao = "001010011";
                                    break;
                                case "$1":
                                    operacao = "000011110";
                                    break;
                                case "%A":
                                    operacao = "000010011";
                            }
                            break;
                        case "(%A)":
                            switch (mnemnonic[2]) {
                                case "$1":
                                    operacao = "001110010";
                                    break;
                                case "%D":
                                    operacao = "001000111";
                            }
                    }
                    break;
                case "rsubw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            switch (mnemnonic[2]) {
                                case "%D":
                                    operacao = "000010011";
                            }
                            break;
                        case "%D":
                            switch (mnemnonic[2]) {
                                case "(%A)":
                                    operacao = "001000111";
                                    break;
                                case "%A":
                                    operacao = "000000111";
                            }
                            break;
                        case "(%A)":
                            switch (mnemnonic[2]) {
                                case "%D":
                                    operacao = "001010011";
                            }
                            break;
                        case "$1":
                            switch (mnemnonic[2]) {
                                case "%A":
                                    operacao = "000110010";
                                    break;
                                case "%D":
                                    operacao = "000011110";
                                    break;
                                case "(%A)":
                                    operacao = "001110010";
                            }
                    }
                    break;
                case "incw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            operacao = "000110111";
                            break;
                        case "%D":
                            operacao = "000011111";
                            break;
                        case "(%A)":
                            operacao = "001110111";
                    }
                    break;
                case "decw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            operacao = "000110010";
                            break;
                        case "%D":
                            operacao = "000001110";
                            break;
                        case "(%A)":
                            operacao = "001110010";
                    }
                    break;
                case "notw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            operacao = "000110001";
                            break;
                        case "%D":
                            operacao = "000001101";
                    }
                    break;
                case "negw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            operacao = "000110011";
                            break;
                        case "%D":
                            operacao = "000001111";
                    }
                    break;
                case "andw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            switch (mnemnonic[2]) {
                                case "%D":
                                    return "000000000";
                            }
                            break;
                        case "%D":
                            switch (mnemnonic[2]) {
                                case "(%A)":
                                    operacao = "001000000";
                                    break;
                                case "%A":
                                    operacao = "000000000";
                            }
                            break;
                        case "(%A)":
                            switch (mnemnonic[2]) {
                                case "%D":
                                    operacao = "001000000";
                            }
                    }
                    break;
                case "orw":
                    switch (mnemnonic[1]) {
                        case "%A":
                            switch (mnemnonic[2]) {
                                case "%D":
                                    operacao = "000010101";
                            }
                            break;
                        case "%D":
                            switch (mnemnonic[2]) {
                                case "(%A)":
                                    operacao = "001010101";
                                    break;
                                case "%A":
                                    operacao = "000010101";
                            }
                            break;
                        case "(%A)":
                            switch (mnemnonic[2]) {
                                case "%D":
                                    operacao = "001010101";
                            }
                    }
            }

        return operacao;
    }

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de jump (salto).
     * @param  mnemnonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 3 bits) com código em linguagem de máquina para a instrução.
     */
    public static String jump(String[] mnemnonic) {

        switch (mnemnonic[0]) {
            case "jmp":
                return "111";
            case "je":
                return "010";
            case "jne":
                return "101";
            case "jg":
                return "001";
            case "jge":
                return "011";
            case "jl":
                return "100";
            case "jle":
                return "110";
            default:
                return "000";
        }
    }

    /**
     * Retorna o código binário de um valor decimal armazenado numa String.
     * @param  symbol valor numérico decimal armazenado em uma String.
     * @return Valor em binário (String de 15 bits) representado com 0s e 1s.
     */
    public static String toBinary(String symbol) {

        int decimal = Integer.parseInt(symbol);
        String binario = Integer.toBinaryString(decimal);

        if (binario.length() < 16){
            StringBuilder add = new StringBuilder();
            for (int i = 0; i < 16 - binario.length(); i++){
                add.append("0");
            }
            binario = add + binario;
        }
        return binario;
    }

}
