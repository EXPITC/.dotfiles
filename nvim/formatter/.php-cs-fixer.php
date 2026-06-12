<?php

declare(strict_types=1);
use PhpCsFixer\Config;
use PhpCsFixer\Finder;

$finder = Finder::create()
    ->in(__DIR__)
    ->name('*.php')
    ->notName('*.blade.php') // optional if you're mixing with Laravel
    ->exclude(['var', 'vendor', 'node_modules']);

return (new Config())
    ->setRiskyAllowed(true)
    ->setRules(
        [
            '@Symfony'                    => true,
            '@Symfony:risky'              => true,
            'array_syntax'                => ['syntax' => 'short'],
            'binary_operator_spaces'      => ['default' => 'align_single_space_minimal'],
            'blank_line_before_statement' => ['statements' => ['return', 'throw']],
            'declare_strict_types'        => true,
            'no_superfluous_phpdoc_tags'  => true,
            'phpdoc_separation'           => true,
            'phpdoc_trim'                 => true,
            'phpdoc_align'                => ['align' => 'left'],
            'ordered_imports'             => ['sort_algorithm' => 'alpha'],
            'single_quote'                => true,
            'trailing_comma_in_multiline' => ['elements' => ['arrays']],
            'no_unused_imports'           => true,
            'native_function_invocation'  => ['include' => ['@all']],
            'method_argument_space'       => ['on_multiline' => 'ensure_fully_multiline'],  // Ensure multiline arguments
        ]
    )
    ->setFinder($finder);
