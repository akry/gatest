package jp.akry.gatest

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class GatestApplication

fun main(args: Array<String>) {
	runApplication<GatestApplication>(*args)
}
