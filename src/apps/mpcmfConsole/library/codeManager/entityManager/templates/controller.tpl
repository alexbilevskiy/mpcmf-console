<?php
{assign var="data" value=$entityData['struct'][$entityKey]}

namespace {$entityData['moduleNamespace']}\controllers;

use mpcmf\modules\moduleBase\controllers\controllerBase;
use mpcmf\system\pattern\singleton;
use {$entityData['moduleNamespace']}\mappers\{$entityData['name']}Mapper;

/**
 * Class {$data['className']}
 *
{if !empty($entityData['description'])}
 * {$entityData['description']|replace:"\n":"\n * "}
 *
{/if}
{include file="generator.tpl"}
 *
 * @package {$entityData['moduleNamespace']}\controllers;
 *
{foreach from=$entityData['authors'] item='author'}
 * @author {$author['name']} <{$author['email']}>
{/foreach}
 *
 * @method {$entityData['name']}Mapper getMapper
 */
class {$data['className']}
    extends controllerBase
{

    use singleton;
}